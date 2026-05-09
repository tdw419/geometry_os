; DESCRIPTION: Draws a white rectangle at (197, 25) with width 59 and height 15.
; PLAN: r0=197(x), r1=25(y), r2=59(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 25
LDI r2, 59
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
