; DESCRIPTION: Draws a magenta rectangle at (460, 78) with width 27 and height 59.
; PLAN: r0=460(x), r1=78(y), r2=27(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 78
LDI r2, 27
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
