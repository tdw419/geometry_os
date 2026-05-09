; DESCRIPTION: Draws a white line from (177, 207) to (12, 161).
; PLAN: r0=177(x1), r1=207(y1), r2=12(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 207
LDI r2, 12
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
