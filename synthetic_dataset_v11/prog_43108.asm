; DESCRIPTION: Draws a white line from (252, 133) to (130, 1).
; PLAN: r0=252(x1), r1=133(y1), r2=130(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 133
LDI r2, 130
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
