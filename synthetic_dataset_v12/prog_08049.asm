; DESCRIPTION: Places a orange line segment connecting (504, 172) to (190, 37).
; PLAN: r0=504(x1), r1=172(y1), r2=190(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 172
LDI r2, 190
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
