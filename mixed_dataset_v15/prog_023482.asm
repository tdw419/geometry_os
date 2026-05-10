; DESCRIPTION: Renders a green line between points (399, 199) and (494, 119).
; PLAN: r0=399(x1), r1=199(y1), r2=494(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 199
LDI r2, 494
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
