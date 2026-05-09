; DESCRIPTION: Composite: . Then Places a red line segment connecting (48, 4) to (10, 152). Then Places a white 45x84 rectangle at position (125, 86).
; PLAN: r0=48(x1), r1=4(y1), r2=10(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=86(y), r2=45(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (48, 4) to (10, 152).
; PLAN: r0=48(x1), r1=4(y1), r2=10(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 4
LDI r2, 10
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 45x84 rectangle at position (125, 86).
; PLAN: r0=125(x), r1=86(y), r2=45(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 86
LDI r2, 45
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
