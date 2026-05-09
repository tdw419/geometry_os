; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (151, 111) with radius 80. Then Draws a red rectangle at (183, 36) with width 38 and height 65.
; PLAN: r0=151(x), r1=111(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=183(x), r1=36(y), r2=38(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (151, 111) with radius 80.
; PLAN: r0=151(x), r1=111(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 111
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (183, 36) with width 38 and height 65.
; PLAN: r0=183(x), r1=36(y), r2=38(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 36
LDI r2, 38
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
