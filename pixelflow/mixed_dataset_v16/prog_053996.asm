; DESCRIPTION: Draws a white line from (13, 141) to (377, 126).
; PLAN: r0=13(x1), r1=141(y1), r2=377(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 141
LDI r2, 377
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
