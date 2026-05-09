; DESCRIPTION: Draws a white line from (316, 28) to (161, 176).
; PLAN: r0=316(x1), r1=28(y1), r2=161(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 28
LDI r2, 161
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
