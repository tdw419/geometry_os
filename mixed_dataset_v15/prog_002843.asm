; DESCRIPTION: Draws a blue line from (264, 157) to (115, 154).
; PLAN: r0=264(x1), r1=157(y1), r2=115(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 157
LDI r2, 115
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
