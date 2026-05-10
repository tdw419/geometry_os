; DESCRIPTION: Places a cyan line segment connecting (451, 224) to (259, 248).
; PLAN: r0=451(x1), r1=224(y1), r2=259(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 224
LDI r2, 259
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
