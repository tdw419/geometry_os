; DESCRIPTION: Renders a cyan line segment connecting (314, 137) to (187, 148).
; PLAN: r0=314(x1), r1=137(y1), r2=187(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 137
LDI r2, 187
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
