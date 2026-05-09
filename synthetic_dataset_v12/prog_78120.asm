; DESCRIPTION: Draws a green rectangle at (165, 197) with width 72 and height 47.
; PLAN: r0=165(x), r1=197(y), r2=72(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 197
LDI r2, 72
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
