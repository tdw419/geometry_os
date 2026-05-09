; DESCRIPTION: Composite: . Then Renders a red box of size 46x50 starting at (100, 139). Then Draws a yellow circle centered at (159, 201) with radius 30.
; PLAN: r0=100(x), r1=139(y), r2=46(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=201(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 46x50 starting at (100, 139).
; PLAN: r0=100(x), r1=139(y), r2=46(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 139
LDI r2, 46
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (159, 201) with radius 30.
; PLAN: r0=159(x), r1=201(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 201
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
