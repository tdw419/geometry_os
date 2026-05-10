; DESCRIPTION: Draws a blue line from (116, 214) to (111, 154).
; PLAN: r0=116(x1), r1=214(y1), r2=111(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 214
LDI r2, 111
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
