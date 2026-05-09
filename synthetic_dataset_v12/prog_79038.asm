; DESCRIPTION: Renders a blue line between points (43, 92) and (336, 154).
; PLAN: r0=43(x1), r1=92(y1), r2=336(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 92
LDI r2, 336
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
