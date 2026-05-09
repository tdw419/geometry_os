; DESCRIPTION: Renders a white line between points (122, 199) and (169, 224).
; PLAN: r0=122(x1), r1=199(y1), r2=169(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 199
LDI r2, 169
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
