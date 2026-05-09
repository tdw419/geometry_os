; DESCRIPTION: Places a cyan line segment connecting (215, 81) to (257, 229).
; PLAN: r0=215(x1), r1=81(y1), r2=257(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 81
LDI r2, 257
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
