; DESCRIPTION: Places a cyan line segment connecting (472, 2) to (25, 135).
; PLAN: r0=472(x1), r1=2(y1), r2=25(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 2
LDI r2, 25
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
