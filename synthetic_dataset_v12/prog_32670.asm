; DESCRIPTION: Places a cyan line segment connecting (416, 224) to (490, 72).
; PLAN: r0=416(x1), r1=224(y1), r2=490(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 224
LDI r2, 490
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
