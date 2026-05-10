; DESCRIPTION: Draws a red rectangle at (276, 73) with width 60 and height 40.
; PLAN: r0=276(x), r1=73(y), r2=60(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 73
LDI r2, 60
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
