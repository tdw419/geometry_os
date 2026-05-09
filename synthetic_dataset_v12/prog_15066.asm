; DESCRIPTION: Places a magenta line segment connecting (438, 178) to (361, 154).
; PLAN: r0=438(x1), r1=178(y1), r2=361(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 178
LDI r2, 361
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
