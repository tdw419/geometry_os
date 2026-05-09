; DESCRIPTION: Draws a yellow rectangle at (239, 78) with width 70 and height 117.
; PLAN: r0=239(x), r1=78(y), r2=70(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 78
LDI r2, 70
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
