; DESCRIPTION: Draws a yellow line from (469, 71) to (44, 106).
; PLAN: r0=469(x1), r1=71(y1), r2=44(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 71
LDI r2, 44
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
