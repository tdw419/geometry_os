; DESCRIPTION: Draws a red rectangle at (329, 47) with width 14 and height 88.
; PLAN: r0=329(x), r1=47(y), r2=14(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 47
LDI r2, 14
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
