; DESCRIPTION: Renders a black line between points (1, 94) and (397, 71).
; PLAN: r0=1(x1), r1=94(y1), r2=397(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 94
LDI r2, 397
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
