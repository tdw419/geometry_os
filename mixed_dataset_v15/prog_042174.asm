; DESCRIPTION: Draws a green rectangle at (221, 34) with width 72 and height 113.
; PLAN: r0=221(x), r1=34(y), r2=72(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 34
LDI r2, 72
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
