; DESCRIPTION: Places a green line segment connecting (257, 146) to (297, 45).
; PLAN: r0=257(x1), r1=146(y1), r2=297(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 146
LDI r2, 297
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
