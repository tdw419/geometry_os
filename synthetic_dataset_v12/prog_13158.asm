; DESCRIPTION: Draws a magenta rectangle at (374, 130) with width 52 and height 92.
; PLAN: r0=374(x), r1=130(y), r2=52(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 130
LDI r2, 52
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
