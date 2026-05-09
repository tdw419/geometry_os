; DESCRIPTION: Draws a red rectangle at (54, 55) with width 25 and height 50.
; PLAN: r0=54(x), r1=55(y), r2=25(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 55
LDI r2, 25
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
