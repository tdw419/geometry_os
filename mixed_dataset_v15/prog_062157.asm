; DESCRIPTION: Renders a black line between points (334, 8) and (339, 239).
; PLAN: r0=334(x1), r1=8(y1), r2=339(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 8
LDI r2, 339
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
