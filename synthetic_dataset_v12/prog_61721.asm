; DESCRIPTION: Places a cyan line segment connecting (376, 66) to (81, 102).
; PLAN: r0=376(x1), r1=66(y1), r2=81(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 66
LDI r2, 81
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
