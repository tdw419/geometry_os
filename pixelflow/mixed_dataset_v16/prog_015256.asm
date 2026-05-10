; DESCRIPTION: Renders a magenta line between points (202, 224) and (169, 153).
; PLAN: r0=202(x1), r1=224(y1), r2=169(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 224
LDI r2, 169
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
