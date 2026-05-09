; DESCRIPTION: Draws a red rectangle at (189, 171) with width 41 and height 10.
; PLAN: r0=189(x), r1=171(y), r2=41(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 171
LDI r2, 41
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
