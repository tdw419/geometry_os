; DESCRIPTION: Renders a black line between points (329, 196) and (358, 226).
; PLAN: r0=329(x1), r1=196(y1), r2=358(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 196
LDI r2, 358
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
