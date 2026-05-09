; DESCRIPTION: Composite: . Then Draws a blue rectangle at (182, 137) with width 68 and height 64. Then Renders a magenta disk with center (151, 168) and radius 32.
; PLAN: r0=182(x), r1=137(y), r2=68(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=168(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (182, 137) with width 68 and height 64.
; PLAN: r0=182(x), r1=137(y), r2=68(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 137
LDI r2, 68
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (151, 168) and radius 32.
; PLAN: r0=151(x), r1=168(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 168
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
