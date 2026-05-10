; DESCRIPTION: Draws a green rectangle at (123, 27) with width 28 and height 56.
; PLAN: r0=123(x), r1=27(y), r2=28(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 27
LDI r2, 28
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
