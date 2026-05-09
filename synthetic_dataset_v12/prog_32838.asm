; DESCRIPTION: Draws a red rectangle at (178, 153) with width 28 and height 26.
; PLAN: r0=178(x), r1=153(y), r2=28(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 153
LDI r2, 28
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
