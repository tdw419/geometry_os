; DESCRIPTION: Draws a black line from (319, 31) to (248, 222).
; PLAN: r0=319(x1), r1=31(y1), r2=248(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 31
LDI r2, 248
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
