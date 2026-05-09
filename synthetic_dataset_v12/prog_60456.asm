; DESCRIPTION: Renders a yellow line between points (171, 233) and (461, 197).
; PLAN: r0=171(x1), r1=233(y1), r2=461(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 233
LDI r2, 461
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
