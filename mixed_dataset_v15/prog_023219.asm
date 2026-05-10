; DESCRIPTION: Draws a white line from (232, 79) to (310, 175).
; PLAN: r0=232(x1), r1=79(y1), r2=310(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 79
LDI r2, 310
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
