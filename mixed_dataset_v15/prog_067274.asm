; DESCRIPTION: Draws a white line from (103, 161) to (302, 252).
; PLAN: r0=103(x1), r1=161(y1), r2=302(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 161
LDI r2, 302
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
