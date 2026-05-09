; DESCRIPTION: Places a cyan line segment connecting (442, 78) to (441, 39).
; PLAN: r0=442(x1), r1=78(y1), r2=441(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 78
LDI r2, 441
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
