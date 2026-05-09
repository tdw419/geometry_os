; DESCRIPTION: Draws a purple line from (166, 29) to (178, 83).
; PLAN: r0=166(x1), r1=29(y1), r2=178(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 29
LDI r2, 178
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
