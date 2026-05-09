; DESCRIPTION: Composite: . Then Renders a black box of size 28x35 starting at (96, 8). Then Creates a black circular shape at (39, 228) with radius 22.
; PLAN: r0=96(x), r1=8(y), r2=28(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=39(x), r1=228(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 28x35 starting at (96, 8).
; PLAN: r0=96(x), r1=8(y), r2=28(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 8
LDI r2, 28
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (39, 228) with radius 22.
; PLAN: r0=39(x), r1=228(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 228
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
