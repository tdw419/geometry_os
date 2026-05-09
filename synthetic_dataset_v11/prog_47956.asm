; DESCRIPTION: Renders a yellow line between points (177, 165) and (190, 234).
; PLAN: r0=177(x1), r1=165(y1), r2=190(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 165
LDI r2, 190
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
