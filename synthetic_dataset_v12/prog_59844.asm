; DESCRIPTION: Places a cyan line segment connecting (467, 236) to (247, 10).
; PLAN: r0=467(x1), r1=236(y1), r2=247(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 236
LDI r2, 247
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
