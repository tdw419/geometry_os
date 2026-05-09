; DESCRIPTION: Draws a magenta rectangle at (41, 124) with width 21 and height 28.
; PLAN: r0=41(x), r1=124(y), r2=21(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 124
LDI r2, 21
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
