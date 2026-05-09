; DESCRIPTION: Places a cyan line segment connecting (414, 244) to (364, 127).
; PLAN: r0=414(x1), r1=244(y1), r2=364(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 244
LDI r2, 364
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
