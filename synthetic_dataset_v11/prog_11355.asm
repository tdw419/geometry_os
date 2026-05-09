; DESCRIPTION: Places a cyan line segment connecting (90, 179) to (106, 102).
; PLAN: r0=90(x1), r1=179(y1), r2=106(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 179
LDI r2, 106
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
