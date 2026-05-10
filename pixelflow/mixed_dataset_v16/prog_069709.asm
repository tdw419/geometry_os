; DESCRIPTION: Draws a cyan line from (391, 102) to (351, 153).
; PLAN: r0=391(x1), r1=102(y1), r2=351(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 102
LDI r2, 351
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
