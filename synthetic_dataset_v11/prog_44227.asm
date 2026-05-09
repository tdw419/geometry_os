; DESCRIPTION: Places a cyan line segment connecting (135, 42) to (34, 116).
; PLAN: r0=135(x1), r1=42(y1), r2=34(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 42
LDI r2, 34
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
