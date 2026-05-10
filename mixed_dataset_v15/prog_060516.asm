; DESCRIPTION: Renders a yellow line between points (170, 166) and (378, 71).
; PLAN: r0=170(x1), r1=166(y1), r2=378(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 166
LDI r2, 378
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
