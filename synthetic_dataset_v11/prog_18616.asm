; DESCRIPTION: Composite: . Then Renders a yellow box of size 93x107 starting at (92, 143). Then Draws a magenta circle centered at (71, 165) with radius 50.
; PLAN: r0=92(x), r1=143(y), r2=93(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=71(x), r1=165(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 93x107 starting at (92, 143).
; PLAN: r0=92(x), r1=143(y), r2=93(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 143
LDI r2, 93
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (71, 165) with radius 50.
; PLAN: r0=71(x), r1=165(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 165
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
