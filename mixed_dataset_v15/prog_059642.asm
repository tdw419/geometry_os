; DESCRIPTION: Draws a magenta rectangle at (171, 14) with width 27 and height 96.
; PLAN: r0=171(x), r1=14(y), r2=27(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 14
LDI r2, 27
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
