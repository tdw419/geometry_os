; DESCRIPTION: Composite: . Then Renders a white disk with center (146, 113) and radius 39. Then Renders a blue box of size 59x30 starting at (190, 28).
; PLAN: r0=146(x), r1=113(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=190(x), r1=28(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (146, 113) and radius 39.
; PLAN: r0=146(x), r1=113(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 113
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 59x30 starting at (190, 28).
; PLAN: r0=190(x), r1=28(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 28
LDI r2, 59
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
