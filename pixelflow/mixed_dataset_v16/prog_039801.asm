; DESCRIPTION: Draws a blue rectangle at (28, 27) with width 71 and height 117.
; PLAN: r0=28(x), r1=27(y), r2=71(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 27
LDI r2, 71
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
