; DESCRIPTION: Places a cyan line segment connecting (395, 255) to (179, 130).
; PLAN: r0=395(x1), r1=255(y1), r2=179(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 255
LDI r2, 179
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
