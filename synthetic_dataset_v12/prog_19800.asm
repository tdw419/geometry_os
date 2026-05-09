; DESCRIPTION: Draws a magenta rectangle at (214, 27) with width 116 and height 65.
; PLAN: r0=214(x), r1=27(y), r2=116(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 27
LDI r2, 116
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
