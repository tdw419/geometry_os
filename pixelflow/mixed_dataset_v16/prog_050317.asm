; DESCRIPTION: Draws a blue rectangle at (228, 27) with width 43 and height 11.
; PLAN: r0=228(x), r1=27(y), r2=43(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 27
LDI r2, 43
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
