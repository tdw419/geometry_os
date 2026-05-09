; DESCRIPTION: Draws a red line from (92, 175) to (412, 179).
; PLAN: r0=92(x1), r1=175(y1), r2=412(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 175
LDI r2, 412
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
