; DESCRIPTION: Draws a white line from (232, 2) to (265, 207).
; PLAN: r0=232(x1), r1=2(y1), r2=265(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 2
LDI r2, 265
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
