; DESCRIPTION: Places a black line segment connecting (95, 196) to (156, 12).
; PLAN: r0=95(x1), r1=196(y1), r2=156(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 196
LDI r2, 156
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
