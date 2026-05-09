; DESCRIPTION: Renders a yellow line between points (362, 155) and (388, 190).
; PLAN: r0=362(x1), r1=155(y1), r2=388(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 155
LDI r2, 388
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
