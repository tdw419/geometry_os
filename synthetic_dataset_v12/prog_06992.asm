; DESCRIPTION: Draws a red rectangle at (53, 54) with width 72 and height 24.
; PLAN: r0=53(x), r1=54(y), r2=72(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 54
LDI r2, 72
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
