; DESCRIPTION: Draws a blue line from (444, 161) to (257, 154).
; PLAN: r0=444(x1), r1=161(y1), r2=257(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 161
LDI r2, 257
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
