; DESCRIPTION: Renders a black line between points (501, 254) and (474, 205).
; PLAN: r0=501(x1), r1=254(y1), r2=474(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 254
LDI r2, 474
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
