; DESCRIPTION: Draws a red rectangle at (72, 130) with width 116 and height 59.
; PLAN: r0=72(x), r1=130(y), r2=116(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 130
LDI r2, 116
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
