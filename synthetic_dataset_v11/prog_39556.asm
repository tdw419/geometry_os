; DESCRIPTION: Composite: . Then Renders a yellow box of size 52x61 starting at (171, 141). Then Draws a magenta circle centered at (37, 76) with radius 16.
; PLAN: r0=171(x), r1=141(y), r2=52(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=37(x), r1=76(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 52x61 starting at (171, 141).
; PLAN: r0=171(x), r1=141(y), r2=52(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 141
LDI r2, 52
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (37, 76) with radius 16.
; PLAN: r0=37(x), r1=76(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 76
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
