; DESCRIPTION: Renders a white line between points (285, 233) and (494, 254).
; PLAN: r0=285(x1), r1=233(y1), r2=494(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 233
LDI r2, 494
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
