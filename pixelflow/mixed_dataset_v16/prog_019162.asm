; DESCRIPTION: Renders a black line between points (246, 36) and (494, 10).
; PLAN: r0=246(x1), r1=36(y1), r2=494(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 36
LDI r2, 494
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
