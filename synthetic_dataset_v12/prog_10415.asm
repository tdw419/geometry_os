; DESCRIPTION: Places a green line segment connecting (444, 193) to (95, 109).
; PLAN: r0=444(x1), r1=193(y1), r2=95(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 193
LDI r2, 95
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
