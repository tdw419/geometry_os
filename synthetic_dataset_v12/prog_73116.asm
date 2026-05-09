; DESCRIPTION: Draws a magenta line from (148, 179) to (294, 88).
; PLAN: r0=148(x1), r1=179(y1), r2=294(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 179
LDI r2, 294
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
