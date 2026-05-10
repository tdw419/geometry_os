; DESCRIPTION: Draws a green line from (495, 101) to (165, 176).
; PLAN: r0=495(x1), r1=101(y1), r2=165(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 101
LDI r2, 165
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
