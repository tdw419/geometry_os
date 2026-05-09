; DESCRIPTION: Renders a yellow line between points (90, 78) and (92, 56).
; PLAN: r0=90(x1), r1=78(y1), r2=92(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 78
LDI r2, 92
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
