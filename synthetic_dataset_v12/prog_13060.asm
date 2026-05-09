; DESCRIPTION: Places a black line segment connecting (288, 113) to (74, 197).
; PLAN: r0=288(x1), r1=113(y1), r2=74(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 113
LDI r2, 74
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
