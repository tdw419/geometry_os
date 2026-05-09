; DESCRIPTION: Draws a red rectangle at (266, 92) with width 49 and height 82.
; PLAN: r0=266(x), r1=92(y), r2=49(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 92
LDI r2, 49
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
