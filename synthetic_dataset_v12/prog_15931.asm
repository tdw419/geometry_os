; DESCRIPTION: Draws a magenta rectangle at (262, 130) with width 108 and height 18.
; PLAN: r0=262(x), r1=130(y), r2=108(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 130
LDI r2, 108
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
