; DESCRIPTION: Composite: . Then Draws a blue circle centered at (90, 135) with radius 21. Then Places a black line segment connecting (193, 78) to (216, 60).
; PLAN: r0=90(x), r1=135(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=193(x1), r1=78(y1), r2=216(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (90, 135) with radius 21.
; PLAN: r0=90(x), r1=135(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 135
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (193, 78) to (216, 60).
; PLAN: r0=193(x1), r1=78(y1), r2=216(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 78
LDI r2, 216
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
