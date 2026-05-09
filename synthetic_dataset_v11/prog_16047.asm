; DESCRIPTION: Renders a green line between points (169, 224) and (68, 219).
; PLAN: r0=169(x1), r1=224(y1), r2=68(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 224
LDI r2, 68
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
