; DESCRIPTION: Places a green line segment connecting (118, 95) to (157, 86).
; PLAN: r0=118(x1), r1=95(y1), r2=157(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 95
LDI r2, 157
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
