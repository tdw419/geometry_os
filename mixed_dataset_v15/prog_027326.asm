; DESCRIPTION: Renders a cyan line segment connecting (68, 144) to (55, 90).
; PLAN: r0=68(x1), r1=144(y1), r2=55(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 144
LDI r2, 55
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
