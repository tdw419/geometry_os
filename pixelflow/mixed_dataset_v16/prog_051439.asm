; DESCRIPTION: Places a cyan line segment connecting (139, 92) to (379, 226).
; PLAN: r0=139(x1), r1=92(y1), r2=379(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 92
LDI r2, 379
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
