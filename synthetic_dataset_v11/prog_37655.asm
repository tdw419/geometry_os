; DESCRIPTION: Composite: . Then Draws a purple rectangle at (51, 158) with width 25 and height 55. Then Places a white line segment connecting (198, 12) to (243, 46).
; PLAN: r0=51(x), r1=158(y), r2=25(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=198(x1), r1=12(y1), r2=243(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (51, 158) with width 25 and height 55.
; PLAN: r0=51(x), r1=158(y), r2=25(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 158
LDI r2, 25
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (198, 12) to (243, 46).
; PLAN: r0=198(x1), r1=12(y1), r2=243(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 12
LDI r2, 243
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
