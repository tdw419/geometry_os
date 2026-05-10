; DESCRIPTION: Renders a cyan line segment connecting (119, 45) to (110, 119).
; PLAN: r0=119(x1), r1=45(y1), r2=110(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 45
LDI r2, 110
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
