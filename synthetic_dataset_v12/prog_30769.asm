; DESCRIPTION: Draws a red rectangle at (279, 165) with width 78 and height 19.
; PLAN: r0=279(x), r1=165(y), r2=78(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 165
LDI r2, 78
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
