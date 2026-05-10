; DESCRIPTION: Draws a red rectangle at (298, 158) with width 60 and height 70.
; PLAN: r0=298(x), r1=158(y), r2=60(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 158
LDI r2, 60
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
