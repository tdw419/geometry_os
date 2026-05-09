; DESCRIPTION: Composite: . Then Creates a black circular shape at (160, 93) with radius 52. Then Draws a black rectangle at (46, 15) with width 39 and height 106.
; PLAN: r0=160(x), r1=93(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=46(x), r1=15(y), r2=39(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (160, 93) with radius 52.
; PLAN: r0=160(x), r1=93(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 93
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (46, 15) with width 39 and height 106.
; PLAN: r0=46(x), r1=15(y), r2=39(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 15
LDI r2, 39
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
