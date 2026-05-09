; DESCRIPTION: Draws a green rectangle at (33, 165) with width 36 and height 82.
; PLAN: r0=33(x), r1=165(y), r2=36(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 165
LDI r2, 36
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
