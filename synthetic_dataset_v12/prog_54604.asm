; DESCRIPTION: Draws a white line from (172, 53) to (66, 74).
; PLAN: r0=172(x1), r1=53(y1), r2=66(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 53
LDI r2, 66
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
