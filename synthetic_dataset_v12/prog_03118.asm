; DESCRIPTION: Draws a white line from (94, 187) to (278, 14).
; PLAN: r0=94(x1), r1=187(y1), r2=278(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 187
LDI r2, 278
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
