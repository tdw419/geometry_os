; DESCRIPTION: Draws a black line from (319, 196) to (139, 187).
; PLAN: r0=319(x1), r1=196(y1), r2=139(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 196
LDI r2, 139
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
