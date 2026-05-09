; DESCRIPTION: Places a green line segment connecting (289, 8) to (376, 83).
; PLAN: r0=289(x1), r1=8(y1), r2=376(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 8
LDI r2, 376
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
