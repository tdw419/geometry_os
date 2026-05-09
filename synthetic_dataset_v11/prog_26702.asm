; DESCRIPTION: Draws a red rectangle at (110, 18) with width 113 and height 49.
; PLAN: r0=110(x), r1=18(y), r2=113(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 18
LDI r2, 113
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
