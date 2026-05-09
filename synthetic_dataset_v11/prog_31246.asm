; DESCRIPTION: Composite: . Then Renders a blue box of size 80x112 starting at (83, 70). Then Places a blue circle of radius 76 at center (131, 92).
; PLAN: r0=83(x), r1=70(y), r2=80(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x), r1=92(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 80x112 starting at (83, 70).
; PLAN: r0=83(x), r1=70(y), r2=80(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 70
LDI r2, 80
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 76 at center (131, 92).
; PLAN: r0=131(x), r1=92(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 92
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
