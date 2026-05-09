; DESCRIPTION: Renders a yellow line between points (49, 92) and (179, 240).
; PLAN: r0=49(x1), r1=92(y1), r2=179(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 92
LDI r2, 179
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
