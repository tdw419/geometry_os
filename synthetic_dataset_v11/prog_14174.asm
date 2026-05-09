; DESCRIPTION: Composite: . Then Draws a blue circle centered at (74, 42) with radius 17. Then Places a black 95x73 rectangle at position (8, 98).
; PLAN: r0=74(x), r1=42(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=8(x), r1=98(y), r2=95(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (74, 42) with radius 17.
; PLAN: r0=74(x), r1=42(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 42
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 95x73 rectangle at position (8, 98).
; PLAN: r0=8(x), r1=98(y), r2=95(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 98
LDI r2, 95
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
