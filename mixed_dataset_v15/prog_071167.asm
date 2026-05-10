; DESCRIPTION: Draws a green rectangle at (73, 165) with width 32 and height 78.
; PLAN: r0=73(x), r1=165(y), r2=32(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 165
LDI r2, 32
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
