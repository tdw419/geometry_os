; DESCRIPTION: Draws a magenta rectangle at (262, 7) with width 41 and height 60.
; PLAN: r0=262(x), r1=7(y), r2=41(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 7
LDI r2, 41
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
