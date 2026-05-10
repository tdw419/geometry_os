; DESCRIPTION: Places a green line segment connecting (469, 52) to (255, 98).
; PLAN: r0=469(x1), r1=52(y1), r2=255(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 52
LDI r2, 255
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
