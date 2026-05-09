; DESCRIPTION: Draws a red rectangle at (138, 54) with width 32 and height 41.
; PLAN: r0=138(x), r1=54(y), r2=32(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 54
LDI r2, 32
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
