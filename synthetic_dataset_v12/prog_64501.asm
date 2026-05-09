; DESCRIPTION: Renders a yellow line between points (481, 205) and (378, 159).
; PLAN: r0=481(x1), r1=205(y1), r2=378(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 205
LDI r2, 378
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
