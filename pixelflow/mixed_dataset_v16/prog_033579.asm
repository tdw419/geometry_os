; DESCRIPTION: Draws a yellow rectangle at (17, 132) with width 64 and height 56.
; PLAN: r0=17(x), r1=132(y), r2=64(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 132
LDI r2, 64
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
