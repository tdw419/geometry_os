; DESCRIPTION: Draws a red rectangle at (377, 213) with width 78 and height 28.
; PLAN: r0=377(x), r1=213(y), r2=78(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 213
LDI r2, 78
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
