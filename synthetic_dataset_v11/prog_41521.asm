; DESCRIPTION: Places a cyan line segment connecting (194, 40) to (141, 8).
; PLAN: r0=194(x1), r1=40(y1), r2=141(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 40
LDI r2, 141
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
