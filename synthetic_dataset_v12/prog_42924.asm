; DESCRIPTION: Draws a red rectangle at (5, 129) with width 41 and height 78.
; PLAN: r0=5(x), r1=129(y), r2=41(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 129
LDI r2, 41
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
