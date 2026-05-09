; DESCRIPTION: Places a cyan line segment connecting (341, 84) to (482, 49).
; PLAN: r0=341(x1), r1=84(y1), r2=482(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 84
LDI r2, 482
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
