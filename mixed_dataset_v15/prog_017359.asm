; DESCRIPTION: Draws a white line from (164, 158) to (37, 39).
; PLAN: r0=164(x1), r1=158(y1), r2=37(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 158
LDI r2, 37
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
