; DESCRIPTION: Composite: . Then Draws a green rectangle at (72, 210) with width 33 and height 33. Then Places a green circle of radius 42 at center (115, 61).
; PLAN: r0=72(x), r1=210(y), r2=33(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=115(x), r1=61(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (72, 210) with width 33 and height 33.
; PLAN: r0=72(x), r1=210(y), r2=33(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 210
LDI r2, 33
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 42 at center (115, 61).
; PLAN: r0=115(x), r1=61(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 61
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
