; DESCRIPTION: Draws a magenta line from (16, 115) to (92, 101).
; PLAN: r0=16(x1), r1=115(y1), r2=92(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 115
LDI r2, 92
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
