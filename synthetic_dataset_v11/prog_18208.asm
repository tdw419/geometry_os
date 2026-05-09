; DESCRIPTION: Draws a red rectangle at (172, 90) with width 76 and height 73.
; PLAN: r0=172(x), r1=90(y), r2=76(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 90
LDI r2, 76
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
