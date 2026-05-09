; DESCRIPTION: Draws a white line from (354, 161) to (105, 94).
; PLAN: r0=354(x1), r1=161(y1), r2=105(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 161
LDI r2, 105
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
