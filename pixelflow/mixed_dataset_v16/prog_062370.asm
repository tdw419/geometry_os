; DESCRIPTION: Draws a yellow rectangle at (320, 111) with width 94 and height 78.
; PLAN: r0=320(x), r1=111(y), r2=94(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 111
LDI r2, 94
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
