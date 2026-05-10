; DESCRIPTION: Places a cyan line segment connecting (487, 30) to (477, 232).
; PLAN: r0=487(x1), r1=30(y1), r2=477(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 30
LDI r2, 477
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
