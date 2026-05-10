; DESCRIPTION: Places a blue line segment connecting (50, 124) to (272, 224).
; PLAN: r0=50(x1), r1=124(y1), r2=272(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 124
LDI r2, 272
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
