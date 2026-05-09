; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (123, 56) with width 50 and height 86. Then Draws a green circle centered at (178, 95) with radius 74.
; PLAN: r0=123(x), r1=56(y), r2=50(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x), r1=95(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (123, 56) with width 50 and height 86.
; PLAN: r0=123(x), r1=56(y), r2=50(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 56
LDI r2, 50
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (178, 95) with radius 74.
; PLAN: r0=178(x), r1=95(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 95
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
