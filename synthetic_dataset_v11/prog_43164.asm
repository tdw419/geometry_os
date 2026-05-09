; DESCRIPTION: Composite: . Then Places a white circle of radius 63 at center (118, 190). Then Draws a magenta rectangle at (86, 32) with width 72 and height 72.
; PLAN: r0=118(x), r1=190(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=86(x), r1=32(y), r2=72(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 63 at center (118, 190).
; PLAN: r0=118(x), r1=190(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 190
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (86, 32) with width 72 and height 72.
; PLAN: r0=86(x), r1=32(y), r2=72(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 32
LDI r2, 72
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
