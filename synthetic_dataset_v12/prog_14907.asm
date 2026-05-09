; DESCRIPTION: Draws a green line from (508, 183) to (354, 176).
; PLAN: r0=508(x1), r1=183(y1), r2=354(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 183
LDI r2, 354
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
