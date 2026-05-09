; DESCRIPTION: Places a cyan line segment connecting (449, 139) to (467, 199).
; PLAN: r0=449(x1), r1=139(y1), r2=467(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 139
LDI r2, 467
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
