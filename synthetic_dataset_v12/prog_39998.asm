; DESCRIPTION: Renders a green line between points (369, 85) and (494, 24).
; PLAN: r0=369(x1), r1=85(y1), r2=494(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 85
LDI r2, 494
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
