; DESCRIPTION: Draws a red rectangle at (24, 33) with width 41 and height 23.
; PLAN: r0=24(x), r1=33(y), r2=41(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 33
LDI r2, 41
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
