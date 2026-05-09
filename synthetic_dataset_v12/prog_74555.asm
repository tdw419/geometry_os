; DESCRIPTION: Renders a purple line between points (327, 113) and (286, 244).
; PLAN: r0=327(x1), r1=113(y1), r2=286(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 113
LDI r2, 286
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
