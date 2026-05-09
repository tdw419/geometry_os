; DESCRIPTION: Draws a white line from (226, 187) to (122, 217).
; PLAN: r0=226(x1), r1=187(y1), r2=122(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 187
LDI r2, 122
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
