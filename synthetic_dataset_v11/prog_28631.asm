; DESCRIPTION: Composite: . Then Draws a green circle centered at (198, 87) with radius 20. Then Renders a blue box of size 63x18 starting at (119, 117).
; PLAN: r0=198(x), r1=87(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=119(x), r1=117(y), r2=63(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (198, 87) with radius 20.
; PLAN: r0=198(x), r1=87(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 87
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 63x18 starting at (119, 117).
; PLAN: r0=119(x), r1=117(y), r2=63(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 117
LDI r2, 63
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
