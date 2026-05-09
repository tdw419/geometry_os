; DESCRIPTION: Draws a blue rectangle at (88, 228) with width 11 and height 12.
; PLAN: r0=88(x), r1=228(y), r2=11(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 228
LDI r2, 11
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
