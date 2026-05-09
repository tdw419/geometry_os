; DESCRIPTION: Draws a white rectangle at (129, 39) with width 57 and height 118.
; PLAN: r0=129(x), r1=39(y), r2=57(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 39
LDI r2, 57
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
