; DESCRIPTION: Renders a yellow line between points (309, 178) and (195, 0).
; PLAN: r0=309(x1), r1=178(y1), r2=195(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 178
LDI r2, 195
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
