; DESCRIPTION: Places a cyan line segment connecting (441, 240) to (326, 130).
; PLAN: r0=441(x1), r1=240(y1), r2=326(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 240
LDI r2, 326
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
