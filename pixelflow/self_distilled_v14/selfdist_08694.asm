; DESCRIPTION: Renders a cyan line segment connecting (318, 122) to (11, 54).
; PLAN: r0=318(x1), r1=122(y1), r2=11(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 122
LDI r2, 11
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
