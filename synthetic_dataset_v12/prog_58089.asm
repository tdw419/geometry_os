; DESCRIPTION: Draws a white rectangle at (178, 81) with width 92 and height 81.
; PLAN: r0=178(x), r1=81(y), r2=92(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 81
LDI r2, 92
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
