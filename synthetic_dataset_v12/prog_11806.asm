; DESCRIPTION: Draws a green line from (137, 31) to (495, 142).
; PLAN: r0=137(x1), r1=31(y1), r2=495(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 31
LDI r2, 495
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
