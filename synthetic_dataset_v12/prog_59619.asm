; DESCRIPTION: Places a cyan line segment connecting (198, 251) to (192, 1).
; PLAN: r0=198(x1), r1=251(y1), r2=192(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 251
LDI r2, 192
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
