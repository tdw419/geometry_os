; DESCRIPTION: Renders a white line between points (472, 68) and (254, 21).
; PLAN: r0=472(x1), r1=68(y1), r2=254(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 68
LDI r2, 254
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
