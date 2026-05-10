; DESCRIPTION: Renders a cyan line segment connecting (318, 185) to (74, 48).
; PLAN: r0=318(x1), r1=185(y1), r2=74(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 185
LDI r2, 74
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
