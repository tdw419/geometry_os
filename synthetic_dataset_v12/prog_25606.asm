; DESCRIPTION: Draws a red rectangle at (93, 141) with width 46 and height 91.
; PLAN: r0=93(x), r1=141(y), r2=46(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 141
LDI r2, 46
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
