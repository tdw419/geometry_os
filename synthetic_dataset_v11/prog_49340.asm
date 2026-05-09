; DESCRIPTION: Renders a yellow line between points (252, 242) and (169, 92).
; PLAN: r0=252(x1), r1=242(y1), r2=169(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 242
LDI r2, 169
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
