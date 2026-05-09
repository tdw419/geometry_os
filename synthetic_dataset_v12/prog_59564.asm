; DESCRIPTION: Places a cyan line segment connecting (189, 45) to (257, 239).
; PLAN: r0=189(x1), r1=45(y1), r2=257(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 45
LDI r2, 257
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
