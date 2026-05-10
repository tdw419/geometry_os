; DESCRIPTION: Draws a red rectangle at (171, 74) with width 69 and height 92.
; PLAN: r0=171(x), r1=74(y), r2=69(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 74
LDI r2, 69
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
