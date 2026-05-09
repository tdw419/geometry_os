; DESCRIPTION: Composite: . Then Draws a blue circle centered at (129, 139) with radius 67. Then Places a red line segment connecting (249, 47) to (38, 60).
; PLAN: r0=129(x), r1=139(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=249(x1), r1=47(y1), r2=38(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (129, 139) with radius 67.
; PLAN: r0=129(x), r1=139(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 139
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (249, 47) to (38, 60).
; PLAN: r0=249(x1), r1=47(y1), r2=38(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 47
LDI r2, 38
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
