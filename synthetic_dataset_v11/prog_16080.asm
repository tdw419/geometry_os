; DESCRIPTION: Draws a red rectangle at (164, 28) with width 82 and height 110.
; PLAN: r0=164(x), r1=28(y), r2=82(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 28
LDI r2, 82
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
