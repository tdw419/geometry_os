; DESCRIPTION: Places a green line segment connecting (453, 71) to (190, 77).
; PLAN: r0=453(x1), r1=71(y1), r2=190(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 71
LDI r2, 190
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
