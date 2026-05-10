; DESCRIPTION: Draws a cyan line from (378, 22) to (11, 199).
; PLAN: r0=378(x1), r1=22(y1), r2=11(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 22
LDI r2, 11
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
