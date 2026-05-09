; DESCRIPTION: Draws a orange rectangle at (148, 92) with width 71 and height 82.
; PLAN: r0=148(x), r1=92(y), r2=71(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 92
LDI r2, 71
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
