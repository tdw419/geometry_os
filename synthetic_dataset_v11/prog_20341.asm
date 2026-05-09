; DESCRIPTION: Composite: . Then Renders a yellow disk with center (181, 126) and radius 67. Then Draws a white rectangle at (82, 19) with width 42 and height 92.
; PLAN: r0=181(x), r1=126(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=82(x), r1=19(y), r2=42(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (181, 126) and radius 67.
; PLAN: r0=181(x), r1=126(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 126
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (82, 19) with width 42 and height 92.
; PLAN: r0=82(x), r1=19(y), r2=42(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 19
LDI r2, 42
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
