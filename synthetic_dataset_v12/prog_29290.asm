; DESCRIPTION: Draws a red rectangle at (50, 136) with width 92 and height 116.
; PLAN: r0=50(x), r1=136(y), r2=92(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 136
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
