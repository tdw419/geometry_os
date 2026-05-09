; DESCRIPTION: Draws a red rectangle at (49, 50) with width 34 and height 71.
; PLAN: r0=49(x), r1=50(y), r2=34(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 50
LDI r2, 34
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
