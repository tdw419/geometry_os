; DESCRIPTION: Draws a white line from (361, 118) to (390, 154).
; PLAN: r0=361(x1), r1=118(y1), r2=390(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 118
LDI r2, 390
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
