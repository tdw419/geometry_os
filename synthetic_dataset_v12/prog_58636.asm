; DESCRIPTION: Renders a yellow line between points (441, 210) and (511, 140).
; PLAN: r0=441(x1), r1=210(y1), r2=511(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 210
LDI r2, 511
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
