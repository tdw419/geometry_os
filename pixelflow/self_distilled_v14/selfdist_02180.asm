; DESCRIPTION: Renders a cyan line segment connecting (119, 131) to (148, 90).
; PLAN: r0=119(x1), r1=131(y1), r2=148(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 131
LDI r2, 148
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
