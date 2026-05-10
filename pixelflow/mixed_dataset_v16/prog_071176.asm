; DESCRIPTION: Draws a red rectangle at (71, 19) with width 82 and height 73.
; PLAN: r0=71(x), r1=19(y), r2=82(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 19
LDI r2, 82
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
