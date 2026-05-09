; DESCRIPTION: Draws a green line from (114, 135) to (225, 245).
; PLAN: r0=114(x1), r1=135(y1), r2=225(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 135
LDI r2, 225
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
