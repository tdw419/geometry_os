; DESCRIPTION: Places a cyan line segment connecting (49, 90) to (50, 227).
; PLAN: r0=49(x1), r1=90(y1), r2=50(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 90
LDI r2, 50
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
