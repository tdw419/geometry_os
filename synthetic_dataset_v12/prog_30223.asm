; DESCRIPTION: Renders a cyan line between points (159, 196) and (257, 74).
; PLAN: r0=159(x1), r1=196(y1), r2=257(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 196
LDI r2, 257
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
