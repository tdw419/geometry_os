; DESCRIPTION: Composite: . Then Places a blue circle of radius 24 at center (49, 189). Then Renders a white box of size 49x113 starting at (198, 93).
; PLAN: r0=49(x), r1=189(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=198(x), r1=93(y), r2=49(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 24 at center (49, 189).
; PLAN: r0=49(x), r1=189(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 189
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 49x113 starting at (198, 93).
; PLAN: r0=198(x), r1=93(y), r2=49(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 93
LDI r2, 49
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
