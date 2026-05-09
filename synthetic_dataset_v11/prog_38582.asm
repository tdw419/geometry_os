; DESCRIPTION: Composite: . Then Creates a black rectangular region at (6, 124) spanning 109 by 113 pixels. Then Creates a blue circular shape at (81, 116) with radius 74.
; PLAN: r0=6(x), r1=124(y), r2=109(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=116(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (6, 124) spanning 109 by 113 pixels.
; PLAN: r0=6(x), r1=124(y), r2=109(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 124
LDI r2, 109
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (81, 116) with radius 74.
; PLAN: r0=81(x), r1=116(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 116
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
