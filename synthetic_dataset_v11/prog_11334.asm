; DESCRIPTION: Composite: . Then Places a purple line segment connecting (118, 55) to (115, 215). Then Places a orange dot at position (192, 22).
; PLAN: r0=118(x1), r1=55(y1), r2=115(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (118, 55) to (115, 215).
; PLAN: r0=118(x1), r1=55(y1), r2=115(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 55
LDI r2, 115
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (192, 22).
; PLAN: r0=192(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
