; DESCRIPTION: Draws a green rectangle at (142, 173) with width 30 and height 39.
; PLAN: r0=142(x), r1=173(y), r2=30(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 173
LDI r2, 30
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
