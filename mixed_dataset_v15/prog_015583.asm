; DESCRIPTION: Draws a yellow rectangle at (256, 56) with width 71 and height 108.
; PLAN: r0=256(x), r1=56(y), r2=71(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 56
LDI r2, 71
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
