; DESCRIPTION: Renders a green line between points (45, 165) and (312, 93).
; PLAN: r0=45(x1), r1=165(y1), r2=312(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 165
LDI r2, 312
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
