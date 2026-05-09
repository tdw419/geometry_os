; DESCRIPTION: Places a green line segment connecting (208, 154) to (270, 119).
; PLAN: r0=208(x1), r1=154(y1), r2=270(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 154
LDI r2, 270
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
