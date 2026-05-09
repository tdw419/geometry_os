; DESCRIPTION: Draws a yellow rectangle at (320, 202) with width 11 and height 28.
; PLAN: r0=320(x), r1=202(y), r2=11(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 202
LDI r2, 11
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
