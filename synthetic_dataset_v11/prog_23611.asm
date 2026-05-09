; DESCRIPTION: Places a cyan line segment connecting (26, 35) to (101, 49).
; PLAN: r0=26(x1), r1=35(y1), r2=101(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 35
LDI r2, 101
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
