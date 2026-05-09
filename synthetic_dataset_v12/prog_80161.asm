; DESCRIPTION: Draws a green line from (319, 156) to (305, 245).
; PLAN: r0=319(x1), r1=156(y1), r2=305(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 156
LDI r2, 305
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
