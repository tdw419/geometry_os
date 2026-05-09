; DESCRIPTION: Composite: . Then Draws a green circle centered at (184, 98) with radius 69. Then Renders a yellow box of size 80x56 starting at (119, 109).
; PLAN: r0=184(x), r1=98(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=119(x), r1=109(y), r2=80(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (184, 98) with radius 69.
; PLAN: r0=184(x), r1=98(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 98
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 80x56 starting at (119, 109).
; PLAN: r0=119(x), r1=109(y), r2=80(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 109
LDI r2, 80
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
