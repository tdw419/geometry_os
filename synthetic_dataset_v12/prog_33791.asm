; DESCRIPTION: Renders a black line between points (249, 167) and (183, 127).
; PLAN: r0=249(x1), r1=167(y1), r2=183(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 167
LDI r2, 183
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
