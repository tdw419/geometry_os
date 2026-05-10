; DESCRIPTION: Draws a red rectangle at (458, 0) with width 46 and height 68.
; PLAN: r0=458(x), r1=0(y), r2=46(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 0
LDI r2, 46
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
