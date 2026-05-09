; DESCRIPTION: Draws a red rectangle at (369, 184) with width 117 and height 41.
; PLAN: r0=369(x), r1=184(y), r2=117(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 184
LDI r2, 117
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
