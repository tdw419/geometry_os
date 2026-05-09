; DESCRIPTION: Draws a white line from (139, 178) to (43, 141).
; PLAN: r0=139(x1), r1=178(y1), r2=43(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 178
LDI r2, 43
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
