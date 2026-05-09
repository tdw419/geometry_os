; DESCRIPTION: Places a yellow line segment connecting (119, 93) to (48, 100).
; PLAN: r0=119(x1), r1=93(y1), r2=48(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 93
LDI r2, 48
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
