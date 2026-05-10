; DESCRIPTION: Draws a blue line from (338, 248) to (370, 154).
; PLAN: r0=338(x1), r1=248(y1), r2=370(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 248
LDI r2, 370
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
