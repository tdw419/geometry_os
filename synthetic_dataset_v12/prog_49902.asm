; DESCRIPTION: Draws a green rectangle at (387, 43) with width 28 and height 113.
; PLAN: r0=387(x), r1=43(y), r2=28(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 43
LDI r2, 28
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
