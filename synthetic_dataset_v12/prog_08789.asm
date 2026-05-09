; DESCRIPTION: Draws a yellow line from (174, 122) to (351, 192).
; PLAN: r0=174(x1), r1=122(y1), r2=351(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 122
LDI r2, 351
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
