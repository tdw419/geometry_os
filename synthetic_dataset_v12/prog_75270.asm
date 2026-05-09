; DESCRIPTION: Draws a red rectangle at (92, 116) with width 117 and height 61.
; PLAN: r0=92(x), r1=116(y), r2=117(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 116
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
