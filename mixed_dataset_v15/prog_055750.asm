; DESCRIPTION: Draws a red rectangle at (268, 167) with width 64 and height 74.
; PLAN: r0=268(x), r1=167(y), r2=64(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 167
LDI r2, 64
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
