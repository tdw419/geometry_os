; DESCRIPTION: Draws a white line from (212, 188) to (86, 188).
; PLAN: r0=212(x1), r1=188(y1), r2=86(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 188
LDI r2, 86
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
