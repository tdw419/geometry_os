; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (56, 74) with width 100 and height 49. Then Creates a red circular shape at (201, 58) with radius 32.
; PLAN: r0=56(x), r1=74(y), r2=100(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=201(x), r1=58(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (56, 74) with width 100 and height 49.
; PLAN: r0=56(x), r1=74(y), r2=100(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 74
LDI r2, 100
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (201, 58) with radius 32.
; PLAN: r0=201(x), r1=58(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 58
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
