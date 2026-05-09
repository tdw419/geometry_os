; DESCRIPTION: Draws a cyan line from (257, 172) to (139, 1).
; PLAN: r0=257(x1), r1=172(y1), r2=139(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 172
LDI r2, 139
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
