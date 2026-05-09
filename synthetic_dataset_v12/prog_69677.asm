; DESCRIPTION: Draws a red rectangle at (192, 26) with width 28 and height 105.
; PLAN: r0=192(x), r1=26(y), r2=28(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 26
LDI r2, 28
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
