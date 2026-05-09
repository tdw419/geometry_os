; DESCRIPTION: Draws a red rectangle at (117, 119) with width 20 and height 47.
; PLAN: r0=117(x), r1=119(y), r2=20(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 119
LDI r2, 20
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
