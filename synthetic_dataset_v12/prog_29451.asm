; DESCRIPTION: Draws a white line from (183, 73) to (381, 3).
; PLAN: r0=183(x1), r1=73(y1), r2=381(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 73
LDI r2, 381
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
