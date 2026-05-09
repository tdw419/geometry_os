; DESCRIPTION: Draws a white line from (1, 246) to (172, 205).
; PLAN: r0=1(x1), r1=246(y1), r2=172(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 246
LDI r2, 172
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
