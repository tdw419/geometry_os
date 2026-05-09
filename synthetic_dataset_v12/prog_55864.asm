; DESCRIPTION: Draws a red line from (104, 142) to (381, 249).
; PLAN: r0=104(x1), r1=142(y1), r2=381(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 142
LDI r2, 381
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
