; DESCRIPTION: Places a magenta line segment connecting (96, 154) to (110, 36).
; PLAN: r0=96(x1), r1=154(y1), r2=110(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 154
LDI r2, 110
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
