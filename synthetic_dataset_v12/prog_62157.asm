; DESCRIPTION: Draws a blue line from (390, 103) to (101, 154).
; PLAN: r0=390(x1), r1=103(y1), r2=101(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 103
LDI r2, 101
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
