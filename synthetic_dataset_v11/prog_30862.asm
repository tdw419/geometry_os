; DESCRIPTION: Draws a red rectangle at (129, 151) with width 67 and height 78.
; PLAN: r0=129(x), r1=151(y), r2=67(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 151
LDI r2, 67
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
