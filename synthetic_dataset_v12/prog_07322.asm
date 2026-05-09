; DESCRIPTION: Renders a white line between points (119, 16) and (18, 93).
; PLAN: r0=119(x1), r1=16(y1), r2=18(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 16
LDI r2, 18
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
