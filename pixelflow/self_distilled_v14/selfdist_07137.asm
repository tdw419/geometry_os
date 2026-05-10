; DESCRIPTION: Renders a cyan line segment connecting (3, 85) to (241, 78).
; PLAN: r0=3(x1), r1=85(y1), r2=241(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 85
LDI r2, 241
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
