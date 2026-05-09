; DESCRIPTION: Renders a cyan line between points (257, 25) and (24, 69).
; PLAN: r0=257(x1), r1=25(y1), r2=24(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 25
LDI r2, 24
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
