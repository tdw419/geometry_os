; DESCRIPTION: Renders a green line segment connecting (39, 85) to (31, 6).
; PLAN: r0=39(x1), r1=85(y1), r2=31(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 85
LDI r2, 31
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
