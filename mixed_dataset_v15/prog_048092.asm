; DESCRIPTION: Renders a black line between points (213, 227) and (74, 167).
; PLAN: r0=213(x1), r1=227(y1), r2=74(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 227
LDI r2, 74
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
