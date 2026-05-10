; DESCRIPTION: Draws a red rectangle at (268, 1) with width 60 and height 30.
; PLAN: r0=268(x), r1=1(y), r2=60(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 1
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
