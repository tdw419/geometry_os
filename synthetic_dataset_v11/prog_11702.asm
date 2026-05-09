; DESCRIPTION: Draws a magenta line from (169, 189) to (42, 179).
; PLAN: r0=169(x1), r1=189(y1), r2=42(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 189
LDI r2, 42
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
