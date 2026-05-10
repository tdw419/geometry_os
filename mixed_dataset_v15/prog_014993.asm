; DESCRIPTION: Draws a red rectangle at (5, 82) with width 41 and height 87.
; PLAN: r0=5(x), r1=82(y), r2=41(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 82
LDI r2, 41
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
