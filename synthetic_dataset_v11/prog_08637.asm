; DESCRIPTION: Composite: . Then Places a purple 62x70 rectangle at position (66, 51). Then Places a black line segment connecting (173, 1) to (144, 152).
; PLAN: r0=66(x), r1=51(y), r2=62(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x1), r1=1(y1), r2=144(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 62x70 rectangle at position (66, 51).
; PLAN: r0=66(x), r1=51(y), r2=62(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 51
LDI r2, 62
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (173, 1) to (144, 152).
; PLAN: r0=173(x1), r1=1(y1), r2=144(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 1
LDI r2, 144
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
