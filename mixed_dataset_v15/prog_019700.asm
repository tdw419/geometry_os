; DESCRIPTION: Renders a cyan line between points (257, 162) and (63, 216).
; PLAN: r0=257(x1), r1=162(y1), r2=63(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 162
LDI r2, 63
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
