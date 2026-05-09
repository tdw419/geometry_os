; DESCRIPTION: Draws a black line from (73, 148) to (11, 154).
; PLAN: r0=73(x1), r1=148(y1), r2=11(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 148
LDI r2, 11
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
