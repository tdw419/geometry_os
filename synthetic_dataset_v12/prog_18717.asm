; DESCRIPTION: Draws a yellow rectangle at (239, 33) with width 12 and height 91.
; PLAN: r0=239(x), r1=33(y), r2=12(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 33
LDI r2, 12
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
