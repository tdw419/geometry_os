; DESCRIPTION: Draws a green rectangle at (77, 86) with width 111 and height 53.
; PLAN: r0=77(x), r1=86(y), r2=111(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 86
LDI r2, 111
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
