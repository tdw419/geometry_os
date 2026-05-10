; DESCRIPTION: Places a green line segment connecting (93, 35) to (208, 5).
; PLAN: r0=93(x1), r1=35(y1), r2=208(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 35
LDI r2, 208
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
