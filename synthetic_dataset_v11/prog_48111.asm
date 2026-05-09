; DESCRIPTION: Composite: . Then Draws a white rectangle at (82, 180) with width 86 and height 51. Then Creates a magenta circular shape at (64, 118) with radius 47.
; PLAN: r0=82(x), r1=180(y), r2=86(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=64(x), r1=118(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (82, 180) with width 86 and height 51.
; PLAN: r0=82(x), r1=180(y), r2=86(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 180
LDI r2, 86
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (64, 118) with radius 47.
; PLAN: r0=64(x), r1=118(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 118
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
