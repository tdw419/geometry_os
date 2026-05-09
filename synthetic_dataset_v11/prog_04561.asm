; DESCRIPTION: Composite: . Then Renders a white disk with center (73, 167) and radius 28. Then Places a blue 115x11 rectangle at position (89, 121).
; PLAN: r0=73(x), r1=167(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x), r1=121(y), r2=115(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (73, 167) and radius 28.
; PLAN: r0=73(x), r1=167(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 167
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 115x11 rectangle at position (89, 121).
; PLAN: r0=89(x), r1=121(y), r2=115(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 121
LDI r2, 115
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
