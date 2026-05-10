; DESCRIPTION: Renders a cyan line segment connecting (129, 105) to (91, 167).
; PLAN: r0=129(x1), r1=105(y1), r2=91(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 105
LDI r2, 91
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
