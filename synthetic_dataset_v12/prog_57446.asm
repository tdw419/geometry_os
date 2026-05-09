; DESCRIPTION: Draws a red rectangle at (124, 60) with width 69 and height 19.
; PLAN: r0=124(x), r1=60(y), r2=69(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 60
LDI r2, 69
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
