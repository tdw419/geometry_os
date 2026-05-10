; DESCRIPTION: Places a magenta line segment connecting (272, 189) to (296, 179).
; PLAN: r0=272(x1), r1=189(y1), r2=296(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 189
LDI r2, 296
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
