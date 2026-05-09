; DESCRIPTION: Draws a cyan line from (495, 174) to (351, 122).
; PLAN: r0=495(x1), r1=174(y1), r2=351(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 174
LDI r2, 351
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
