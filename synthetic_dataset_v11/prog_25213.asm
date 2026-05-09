; DESCRIPTION: Draws a green rectangle at (178, 82) with width 67 and height 105.
; PLAN: r0=178(x), r1=82(y), r2=67(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 82
LDI r2, 67
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
