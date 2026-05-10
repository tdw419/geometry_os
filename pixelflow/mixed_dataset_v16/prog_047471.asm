; DESCRIPTION: Renders a white line between points (121, 132) and (388, 232).
; PLAN: r0=121(x1), r1=132(y1), r2=388(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 132
LDI r2, 388
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
