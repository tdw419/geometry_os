; DESCRIPTION: Renders a green line between points (289, 26) and (81, 11).
; PLAN: r0=289(x1), r1=26(y1), r2=81(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 26
LDI r2, 81
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
