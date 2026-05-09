; DESCRIPTION: Composite: . Then Renders a magenta disk with center (106, 189) and radius 55. Then Draws a purple rectangle at (173, 116) with width 33 and height 119.
; PLAN: r0=106(x), r1=189(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=173(x), r1=116(y), r2=33(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (106, 189) and radius 55.
; PLAN: r0=106(x), r1=189(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 189
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (173, 116) with width 33 and height 119.
; PLAN: r0=173(x), r1=116(y), r2=33(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 116
LDI r2, 33
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
