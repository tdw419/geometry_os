; DESCRIPTION: Places a cyan line segment connecting (189, 163) to (119, 160).
; PLAN: r0=189(x1), r1=163(y1), r2=119(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 163
LDI r2, 119
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
