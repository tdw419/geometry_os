; DESCRIPTION: Draws a white line from (252, 134) to (281, 149).
; PLAN: r0=252(x1), r1=134(y1), r2=281(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 134
LDI r2, 281
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
