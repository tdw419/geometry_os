; DESCRIPTION: Draws a white line from (183, 133) to (177, 122).
; PLAN: r0=183(x1), r1=133(y1), r2=177(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 133
LDI r2, 177
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
