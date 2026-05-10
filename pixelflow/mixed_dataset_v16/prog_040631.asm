; DESCRIPTION: Places a green line segment connecting (376, 96) to (467, 83).
; PLAN: r0=376(x1), r1=96(y1), r2=467(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 96
LDI r2, 467
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
