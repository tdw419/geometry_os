; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (57, 166) with radius 53. Then Renders a black box of size 24x78 starting at (6, 50).
; PLAN: r0=57(x), r1=166(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=6(x), r1=50(y), r2=24(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (57, 166) with radius 53.
; PLAN: r0=57(x), r1=166(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 166
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 24x78 starting at (6, 50).
; PLAN: r0=6(x), r1=50(y), r2=24(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 50
LDI r2, 24
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
