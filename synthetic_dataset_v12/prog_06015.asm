; DESCRIPTION: Draws a red rectangle at (101, 92) with width 120 and height 66.
; PLAN: r0=101(x), r1=92(y), r2=120(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 92
LDI r2, 120
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
