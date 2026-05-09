; DESCRIPTION: Draws a green rectangle at (3, 199) with width 103 and height 57.
; PLAN: r0=3(x), r1=199(y), r2=103(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 199
LDI r2, 103
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
