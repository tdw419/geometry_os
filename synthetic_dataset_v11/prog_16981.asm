; DESCRIPTION: Renders a cyan line between points (155, 141) and (73, 230).
; PLAN: r0=155(x1), r1=141(y1), r2=73(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 141
LDI r2, 73
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
