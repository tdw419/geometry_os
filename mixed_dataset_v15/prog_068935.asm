; DESCRIPTION: Draws a cyan line from (351, 182) to (511, 102).
; PLAN: r0=351(x1), r1=182(y1), r2=511(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 182
LDI r2, 511
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
