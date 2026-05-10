; DESCRIPTION: Renders a cyan line between points (122, 203) and (326, 147).
; PLAN: r0=122(x1), r1=203(y1), r2=326(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 203
LDI r2, 326
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
