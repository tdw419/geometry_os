; DESCRIPTION: Draws a red rectangle at (39, 76) with width 116 and height 71.
; PLAN: r0=39(x), r1=76(y), r2=116(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 76
LDI r2, 116
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
