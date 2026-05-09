; DESCRIPTION: Places a cyan line segment connecting (326, 31) to (85, 73).
; PLAN: r0=326(x1), r1=31(y1), r2=85(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 31
LDI r2, 85
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
