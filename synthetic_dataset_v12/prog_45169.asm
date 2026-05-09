; DESCRIPTION: Draws a white line from (452, 90) to (428, 183).
; PLAN: r0=452(x1), r1=90(y1), r2=428(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 90
LDI r2, 428
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
