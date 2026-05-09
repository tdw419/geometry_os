; DESCRIPTION: Places a yellow line segment connecting (461, 190) to (65, 19).
; PLAN: r0=461(x1), r1=190(y1), r2=65(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 190
LDI r2, 65
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
