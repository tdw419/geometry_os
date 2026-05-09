; DESCRIPTION: Draws a red rectangle at (55, 111) with width 85 and height 33.
; PLAN: r0=55(x), r1=111(y), r2=85(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 111
LDI r2, 85
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
