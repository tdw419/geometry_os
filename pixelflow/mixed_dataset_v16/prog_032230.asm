; DESCRIPTION: Places a green line segment connecting (237, 13) to (292, 156).
; PLAN: r0=237(x1), r1=13(y1), r2=292(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 13
LDI r2, 292
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
