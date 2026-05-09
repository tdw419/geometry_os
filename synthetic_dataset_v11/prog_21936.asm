; DESCRIPTION: Composite: . Then Places a black line segment connecting (250, 139) to (197, 10). Then Creates a blue rectangular region at (91, 29) spanning 112 by 70 pixels.
; PLAN: r0=250(x1), r1=139(y1), r2=197(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=29(y), r2=112(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (250, 139) to (197, 10).
; PLAN: r0=250(x1), r1=139(y1), r2=197(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 139
LDI r2, 197
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (91, 29) spanning 112 by 70 pixels.
; PLAN: r0=91(x), r1=29(y), r2=112(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 29
LDI r2, 112
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
