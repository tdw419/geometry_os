; DESCRIPTION: Draws a red rectangle at (8, 5) with width 26 and height 113.
; PLAN: r0=8(x), r1=5(y), r2=26(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 5
LDI r2, 26
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
