; DESCRIPTION: Places a green line segment connecting (198, 209) to (257, 185).
; PLAN: r0=198(x1), r1=209(y1), r2=257(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 209
LDI r2, 257
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
