; DESCRIPTION: Renders a black line between points (326, 123) and (415, 252).
; PLAN: r0=326(x1), r1=123(y1), r2=415(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 123
LDI r2, 415
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
