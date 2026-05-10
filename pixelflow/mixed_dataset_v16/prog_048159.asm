; DESCRIPTION: Places a green line segment connecting (257, 248) to (295, 137).
; PLAN: r0=257(x1), r1=248(y1), r2=295(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 248
LDI r2, 295
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
