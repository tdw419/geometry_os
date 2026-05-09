; DESCRIPTION: Places a cyan line segment connecting (15, 184) to (247, 135).
; PLAN: r0=15(x1), r1=184(y1), r2=247(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 184
LDI r2, 247
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
