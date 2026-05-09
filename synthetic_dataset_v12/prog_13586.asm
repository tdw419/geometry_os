; DESCRIPTION: Places a magenta line segment connecting (78, 82) to (54, 154).
; PLAN: r0=78(x1), r1=82(y1), r2=54(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 82
LDI r2, 54
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
