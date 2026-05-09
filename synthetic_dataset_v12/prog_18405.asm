; DESCRIPTION: Renders a black line between points (230, 142) and (397, 121).
; PLAN: r0=230(x1), r1=142(y1), r2=397(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 142
LDI r2, 397
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
