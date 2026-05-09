; DESCRIPTION: Renders a yellow line between points (364, 3) and (458, 152).
; PLAN: r0=364(x1), r1=3(y1), r2=458(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 3
LDI r2, 458
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
