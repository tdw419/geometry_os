; DESCRIPTION: Places a cyan line segment connecting (157, 198) to (224, 216).
; PLAN: r0=157(x1), r1=198(y1), r2=224(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 198
LDI r2, 224
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
