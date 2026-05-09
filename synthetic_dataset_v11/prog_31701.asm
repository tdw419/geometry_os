; DESCRIPTION: Draws a red rectangle at (187, 69) with width 20 and height 12.
; PLAN: r0=187(x), r1=69(y), r2=20(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 69
LDI r2, 20
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
