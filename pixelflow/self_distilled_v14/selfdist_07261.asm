; DESCRIPTION: Renders a cyan line segment connecting (73, 192) to (181, 62).
; PLAN: r0=73(x1), r1=192(y1), r2=181(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 192
LDI r2, 181
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
