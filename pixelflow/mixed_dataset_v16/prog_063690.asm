; DESCRIPTION: Renders a green line between points (381, 212) and (339, 62).
; PLAN: r0=381(x1), r1=212(y1), r2=339(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 212
LDI r2, 339
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
