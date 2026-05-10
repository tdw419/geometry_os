; DESCRIPTION: Draws a yellow rectangle at (320, 76) with width 61 and height 17.
; PLAN: r0=320(x), r1=76(y), r2=61(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 76
LDI r2, 61
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
