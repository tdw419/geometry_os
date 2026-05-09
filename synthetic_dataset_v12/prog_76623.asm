; DESCRIPTION: Renders a yellow line between points (90, 152) and (88, 108).
; PLAN: r0=90(x1), r1=152(y1), r2=88(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 152
LDI r2, 88
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
