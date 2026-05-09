; DESCRIPTION: Draws a white line from (37, 197) to (166, 205).
; PLAN: r0=37(x1), r1=197(y1), r2=166(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 197
LDI r2, 166
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
