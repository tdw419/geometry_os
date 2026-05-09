; DESCRIPTION: Draws a magenta line from (313, 137) to (508, 154).
; PLAN: r0=313(x1), r1=137(y1), r2=508(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 137
LDI r2, 508
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
