; DESCRIPTION: Renders a black line between points (332, 113) and (358, 113).
; PLAN: r0=332(x1), r1=113(y1), r2=358(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 113
LDI r2, 358
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
