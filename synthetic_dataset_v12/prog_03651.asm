; DESCRIPTION: Places a black line segment connecting (290, 86) to (492, 118).
; PLAN: r0=290(x1), r1=86(y1), r2=492(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 86
LDI r2, 492
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
