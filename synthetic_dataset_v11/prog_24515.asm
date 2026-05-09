; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (31, 196) with width 71 and height 29. Then Places a white circle of radius 63 at center (79, 120).
; PLAN: r0=31(x), r1=196(y), r2=71(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=79(x), r1=120(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (31, 196) with width 71 and height 29.
; PLAN: r0=31(x), r1=196(y), r2=71(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 196
LDI r2, 71
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 63 at center (79, 120).
; PLAN: r0=79(x), r1=120(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 120
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
