; DESCRIPTION: Places a white line segment connecting (190, 11) to (324, 37).
; PLAN: r0=190(x1), r1=11(y1), r2=324(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 11
LDI r2, 324
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
