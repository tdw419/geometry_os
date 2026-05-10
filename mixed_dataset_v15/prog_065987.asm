; DESCRIPTION: Draws a white line from (12, 161) to (105, 12).
; PLAN: r0=12(x1), r1=161(y1), r2=105(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 161
LDI r2, 105
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
