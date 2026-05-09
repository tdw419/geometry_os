; DESCRIPTION: Composite: . Then Draws a purple circle centered at (93, 213) with radius 18. Then Renders a blue box of size 50x91 starting at (9, 40).
; PLAN: r0=93(x), r1=213(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=40(y), r2=50(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (93, 213) with radius 18.
; PLAN: r0=93(x), r1=213(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 213
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 50x91 starting at (9, 40).
; PLAN: r0=9(x), r1=40(y), r2=50(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 40
LDI r2, 50
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
