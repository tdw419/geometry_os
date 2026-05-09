; DESCRIPTION: Composite: . Then Renders a white box of size 92x52 starting at (161, 0). Then Places a blue circle of radius 43 at center (126, 189).
; PLAN: r0=161(x), r1=0(y), r2=92(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=126(x), r1=189(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 92x52 starting at (161, 0).
; PLAN: r0=161(x), r1=0(y), r2=92(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 0
LDI r2, 92
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 43 at center (126, 189).
; PLAN: r0=126(x), r1=189(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 189
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
