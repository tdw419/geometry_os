; DESCRIPTION: Composite: . Then Renders a white disk with center (219, 49) and radius 37. Then Places a black 29x94 rectangle at position (138, 8).
; PLAN: r0=219(x), r1=49(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=138(x), r1=8(y), r2=29(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (219, 49) and radius 37.
; PLAN: r0=219(x), r1=49(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 49
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 29x94 rectangle at position (138, 8).
; PLAN: r0=138(x), r1=8(y), r2=29(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 8
LDI r2, 29
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
