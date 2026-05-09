; DESCRIPTION: Places a green line segment connecting (382, 65) to (257, 56).
; PLAN: r0=382(x1), r1=65(y1), r2=257(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 65
LDI r2, 257
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
