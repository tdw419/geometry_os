; DESCRIPTION: Places a cyan line segment connecting (23, 25) to (101, 122).
; PLAN: r0=23(x1), r1=25(y1), r2=101(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 25
LDI r2, 101
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
