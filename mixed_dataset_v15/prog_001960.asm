; DESCRIPTION: Draws a red rectangle at (100, 115) with width 17 and height 70.
; PLAN: r0=100(x), r1=115(y), r2=17(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 115
LDI r2, 17
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
