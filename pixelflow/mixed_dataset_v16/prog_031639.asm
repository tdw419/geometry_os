; DESCRIPTION: Renders a black line between points (494, 225) and (329, 104).
; PLAN: r0=494(x1), r1=225(y1), r2=329(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 225
LDI r2, 329
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
