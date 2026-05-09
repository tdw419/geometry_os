; DESCRIPTION: Draws a red rectangle at (412, 26) with width 85 and height 102.
; PLAN: r0=412(x), r1=26(y), r2=85(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 26
LDI r2, 85
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
