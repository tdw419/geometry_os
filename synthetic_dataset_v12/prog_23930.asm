; DESCRIPTION: Draws a red rectangle at (52, 143) with width 76 and height 15.
; PLAN: r0=52(x), r1=143(y), r2=76(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 143
LDI r2, 76
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
