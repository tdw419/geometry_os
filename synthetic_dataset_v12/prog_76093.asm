; DESCRIPTION: Renders a black line between points (420, 181) and (501, 104).
; PLAN: r0=420(x1), r1=181(y1), r2=501(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 181
LDI r2, 501
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
