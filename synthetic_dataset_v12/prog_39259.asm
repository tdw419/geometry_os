; DESCRIPTION: Draws a yellow line from (20, 241) to (415, 245).
; PLAN: r0=20(x1), r1=241(y1), r2=415(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 241
LDI r2, 415
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
