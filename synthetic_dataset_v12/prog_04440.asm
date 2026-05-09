; DESCRIPTION: Places a cyan line segment connecting (350, 83) to (189, 178).
; PLAN: r0=350(x1), r1=83(y1), r2=189(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 83
LDI r2, 189
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
