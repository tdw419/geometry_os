; DESCRIPTION: Draws a magenta line from (59, 123) to (227, 154).
; PLAN: r0=59(x1), r1=123(y1), r2=227(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 123
LDI r2, 227
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
