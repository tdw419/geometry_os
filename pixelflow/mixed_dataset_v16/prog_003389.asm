; DESCRIPTION: Renders a green line segment connecting (95, 66) to (360, 87).
; PLAN: r0=95(x1), r1=66(y1), r2=360(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 66
LDI r2, 360
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
