; DESCRIPTION: Renders a white line between points (2, 184) and (338, 29).
; PLAN: r0=2(x1), r1=184(y1), r2=338(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 184
LDI r2, 338
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
