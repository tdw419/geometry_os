; DESCRIPTION: Composite: . Then Places a black 116x76 rectangle at position (136, 98). Then Places a purple line segment connecting (145, 100) to (115, 222).
; PLAN: r0=136(x), r1=98(y), r2=116(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=145(x1), r1=100(y1), r2=115(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 116x76 rectangle at position (136, 98).
; PLAN: r0=136(x), r1=98(y), r2=116(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 98
LDI r2, 116
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (145, 100) to (115, 222).
; PLAN: r0=145(x1), r1=100(y1), r2=115(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 100
LDI r2, 115
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
