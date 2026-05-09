; DESCRIPTION: Places a cyan line segment connecting (244, 54) to (172, 71).
; PLAN: r0=244(x1), r1=54(y1), r2=172(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 54
LDI r2, 172
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
