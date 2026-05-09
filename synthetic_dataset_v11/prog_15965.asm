; DESCRIPTION: Places a cyan line segment connecting (163, 36) to (48, 116).
; PLAN: r0=163(x1), r1=36(y1), r2=48(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 36
LDI r2, 48
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
