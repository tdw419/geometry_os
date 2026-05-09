; DESCRIPTION: Composite: . Then Draws a purple circle centered at (49, 162) with radius 13. Then Places a blue line segment connecting (232, 44) to (243, 104).
; PLAN: r0=49(x), r1=162(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=232(x1), r1=44(y1), r2=243(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (49, 162) with radius 13.
; PLAN: r0=49(x), r1=162(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 162
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (232, 44) to (243, 104).
; PLAN: r0=232(x1), r1=44(y1), r2=243(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 44
LDI r2, 243
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
