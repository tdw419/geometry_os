; DESCRIPTION: Places a yellow line segment connecting (257, 226) to (161, 255).
; PLAN: r0=257(x1), r1=226(y1), r2=161(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 226
LDI r2, 161
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
