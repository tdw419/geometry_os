; DESCRIPTION: Places a cyan line segment connecting (291, 73) to (511, 158).
; PLAN: r0=291(x1), r1=73(y1), r2=511(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 73
LDI r2, 511
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
