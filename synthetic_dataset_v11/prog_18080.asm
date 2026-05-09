; DESCRIPTION: Renders a black line between points (155, 213) and (208, 205).
; PLAN: r0=155(x1), r1=213(y1), r2=208(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 213
LDI r2, 208
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
