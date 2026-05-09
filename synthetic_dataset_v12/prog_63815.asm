; DESCRIPTION: Places a cyan line segment connecting (34, 203) to (43, 119).
; PLAN: r0=34(x1), r1=203(y1), r2=43(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 203
LDI r2, 43
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
