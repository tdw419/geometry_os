; DESCRIPTION: Draws a white line from (194, 187) to (230, 161).
; PLAN: r0=194(x1), r1=187(y1), r2=230(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 187
LDI r2, 230
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
