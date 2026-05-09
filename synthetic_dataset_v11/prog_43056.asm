; DESCRIPTION: Places a magenta line segment connecting (172, 149) to (6, 154).
; PLAN: r0=172(x1), r1=149(y1), r2=6(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 149
LDI r2, 6
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
