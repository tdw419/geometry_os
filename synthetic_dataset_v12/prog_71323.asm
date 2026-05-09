; DESCRIPTION: Places a cyan line segment connecting (370, 8) to (229, 147).
; PLAN: r0=370(x1), r1=8(y1), r2=229(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 8
LDI r2, 229
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
