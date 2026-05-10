; DESCRIPTION: Places a black line segment connecting (265, 190) to (191, 130).
; PLAN: r0=265(x1), r1=190(y1), r2=191(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 190
LDI r2, 191
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
