; DESCRIPTION: Renders a magenta line between points (171, 251) and (208, 155).
; PLAN: r0=171(x1), r1=251(y1), r2=208(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 251
LDI r2, 208
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
