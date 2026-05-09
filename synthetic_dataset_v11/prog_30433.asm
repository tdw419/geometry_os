; DESCRIPTION: Places a green line segment connecting (73, 224) to (68, 172).
; PLAN: r0=73(x1), r1=224(y1), r2=68(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 224
LDI r2, 68
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
