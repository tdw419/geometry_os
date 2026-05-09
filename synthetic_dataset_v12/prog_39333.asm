; DESCRIPTION: Places a cyan line segment connecting (484, 135) to (40, 184).
; PLAN: r0=484(x1), r1=135(y1), r2=40(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 135
LDI r2, 40
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
