; DESCRIPTION: Places a cyan line segment connecting (95, 62) to (6, 122).
; PLAN: r0=95(x1), r1=62(y1), r2=6(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 62
LDI r2, 6
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
