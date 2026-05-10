; DESCRIPTION: Renders a cyan line segment connecting (15, 17) to (169, 118).
; PLAN: r0=15(x1), r1=17(y1), r2=169(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 17
LDI r2, 169
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
