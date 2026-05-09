; DESCRIPTION: Draws a red rectangle at (181, 1) with width 53 and height 25.
; PLAN: r0=181(x), r1=1(y), r2=53(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 1
LDI r2, 53
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
