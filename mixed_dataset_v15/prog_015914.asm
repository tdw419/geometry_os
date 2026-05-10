; DESCRIPTION: Renders a yellow line segment connecting (301, 152) to (225, 70).
; PLAN: r0=301(x1), r1=152(y1), r2=225(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 152
LDI r2, 225
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
