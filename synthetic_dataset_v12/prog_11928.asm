; DESCRIPTION: Draws a red rectangle at (131, 121) with width 72 and height 92.
; PLAN: r0=131(x), r1=121(y), r2=72(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 121
LDI r2, 72
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
