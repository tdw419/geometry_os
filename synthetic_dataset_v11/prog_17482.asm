; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (32, 133) with radius 27. Then Draws a green rectangle at (45, 85) with width 61 and height 111.
; PLAN: r0=32(x), r1=133(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=45(x), r1=85(y), r2=61(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (32, 133) with radius 27.
; PLAN: r0=32(x), r1=133(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 133
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (45, 85) with width 61 and height 111.
; PLAN: r0=45(x), r1=85(y), r2=61(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 85
LDI r2, 61
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
