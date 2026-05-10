; DESCRIPTION: Renders a yellow line segment connecting (44, 9) to (173, 108).
; PLAN: r0=44(x1), r1=9(y1), r2=173(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 9
LDI r2, 173
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
