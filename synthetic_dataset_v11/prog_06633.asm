; DESCRIPTION: Draws a yellow line from (169, 42) to (237, 177).
; PLAN: r0=169(x1), r1=42(y1), r2=237(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 42
LDI r2, 237
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
