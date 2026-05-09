; DESCRIPTION: Places a cyan line segment connecting (68, 185) to (205, 129).
; PLAN: r0=68(x1), r1=185(y1), r2=205(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 185
LDI r2, 205
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
