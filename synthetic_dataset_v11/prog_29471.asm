; DESCRIPTION: Composite: . Then Draws a white circle centered at (82, 134) with radius 50. Then Places a white 36x53 rectangle at position (50, 101).
; PLAN: r0=82(x), r1=134(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x), r1=101(y), r2=36(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (82, 134) with radius 50.
; PLAN: r0=82(x), r1=134(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 134
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 36x53 rectangle at position (50, 101).
; PLAN: r0=50(x), r1=101(y), r2=36(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 101
LDI r2, 36
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
