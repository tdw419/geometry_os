; DESCRIPTION: Renders a yellow line between points (159, 229) and (230, 171).
; PLAN: r0=159(x1), r1=229(y1), r2=230(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 229
LDI r2, 230
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
