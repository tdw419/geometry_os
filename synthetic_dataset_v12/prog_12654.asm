; DESCRIPTION: Renders a green line between points (263, 103) and (159, 93).
; PLAN: r0=263(x1), r1=103(y1), r2=159(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 103
LDI r2, 159
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
