; DESCRIPTION: Renders a black line between points (218, 2) and (14, 212).
; PLAN: r0=218(x1), r1=2(y1), r2=14(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 2
LDI r2, 14
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
