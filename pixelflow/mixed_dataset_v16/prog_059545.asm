; DESCRIPTION: Draws a green rectangle at (1, 126) with width 21 and height 59.
; PLAN: r0=1(x), r1=126(y), r2=21(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 126
LDI r2, 21
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
