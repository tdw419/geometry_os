; DESCRIPTION: Renders a yellow line between points (171, 213) and (95, 232).
; PLAN: r0=171(x1), r1=213(y1), r2=95(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 213
LDI r2, 95
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
