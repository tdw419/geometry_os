; DESCRIPTION: Draws a red rectangle at (73, 97) with width 95 and height 49.
; PLAN: r0=73(x), r1=97(y), r2=95(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 97
LDI r2, 95
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
