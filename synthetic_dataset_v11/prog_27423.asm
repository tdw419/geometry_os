; DESCRIPTION: Draws a white line from (207, 145) to (14, 249).
; PLAN: r0=207(x1), r1=145(y1), r2=14(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 145
LDI r2, 14
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
