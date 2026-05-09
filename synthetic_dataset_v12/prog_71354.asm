; DESCRIPTION: Places a cyan line segment connecting (343, 199) to (236, 20).
; PLAN: r0=343(x1), r1=199(y1), r2=236(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 199
LDI r2, 236
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
