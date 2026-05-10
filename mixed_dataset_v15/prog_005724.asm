; DESCRIPTION: Draws a yellow rectangle at (474, 219) with width 24 and height 27.
; PLAN: r0=474(x), r1=219(y), r2=24(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 219
LDI r2, 24
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
