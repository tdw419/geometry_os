; DESCRIPTION: Places a cyan line segment connecting (442, 46) to (14, 54).
; PLAN: r0=442(x1), r1=46(y1), r2=14(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 46
LDI r2, 14
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
