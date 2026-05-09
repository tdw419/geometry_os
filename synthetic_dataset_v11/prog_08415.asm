; DESCRIPTION: Renders a black line between points (204, 113) and (230, 202).
; PLAN: r0=204(x1), r1=113(y1), r2=230(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 113
LDI r2, 230
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
