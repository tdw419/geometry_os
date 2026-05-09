; DESCRIPTION: Renders a yellow line between points (229, 231) and (257, 108).
; PLAN: r0=229(x1), r1=231(y1), r2=257(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 231
LDI r2, 257
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
