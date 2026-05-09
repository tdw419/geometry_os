; DESCRIPTION: Draws a red rectangle at (304, 142) with width 102 and height 78.
; PLAN: r0=304(x), r1=142(y), r2=102(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 142
LDI r2, 102
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
