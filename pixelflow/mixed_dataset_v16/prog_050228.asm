; DESCRIPTION: Draws a red rectangle at (305, 132) with width 49 and height 92.
; PLAN: r0=305(x), r1=132(y), r2=49(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 132
LDI r2, 49
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
