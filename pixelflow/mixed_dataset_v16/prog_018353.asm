; DESCRIPTION: Places a green line segment connecting (502, 9) to (257, 158).
; PLAN: r0=502(x1), r1=9(y1), r2=257(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 9
LDI r2, 257
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
