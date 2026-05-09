; DESCRIPTION: Draws a red rectangle at (180, 123) with width 33 and height 72.
; PLAN: r0=180(x), r1=123(y), r2=33(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 123
LDI r2, 33
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
