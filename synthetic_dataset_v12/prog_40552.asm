; DESCRIPTION: Draws a green rectangle at (403, 15) with width 29 and height 107.
; PLAN: r0=403(x), r1=15(y), r2=29(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 15
LDI r2, 29
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
