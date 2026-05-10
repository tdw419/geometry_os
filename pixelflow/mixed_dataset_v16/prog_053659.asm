; DESCRIPTION: Places a cyan line segment connecting (501, 224) to (106, 9).
; PLAN: r0=501(x1), r1=224(y1), r2=106(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 224
LDI r2, 106
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
