; DESCRIPTION: Places a magenta line segment connecting (192, 253) to (234, 154).
; PLAN: r0=192(x1), r1=253(y1), r2=234(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 253
LDI r2, 234
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
