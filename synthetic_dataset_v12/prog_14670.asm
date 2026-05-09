; DESCRIPTION: Places a white line segment connecting (423, 149) to (257, 167).
; PLAN: r0=423(x1), r1=149(y1), r2=257(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 149
LDI r2, 257
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
