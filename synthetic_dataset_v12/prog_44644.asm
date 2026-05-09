; DESCRIPTION: Renders a white line between points (494, 254) and (441, 11).
; PLAN: r0=494(x1), r1=254(y1), r2=441(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 254
LDI r2, 441
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
