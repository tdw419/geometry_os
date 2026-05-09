; DESCRIPTION: Places a cyan line segment connecting (377, 236) to (343, 39).
; PLAN: r0=377(x1), r1=236(y1), r2=343(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 236
LDI r2, 343
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
