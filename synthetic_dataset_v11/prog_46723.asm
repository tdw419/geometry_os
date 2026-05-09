; DESCRIPTION: Draws a white line from (91, 230) to (155, 69).
; PLAN: r0=91(x1), r1=230(y1), r2=155(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 230
LDI r2, 155
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
