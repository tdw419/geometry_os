; DESCRIPTION: Draws a red rectangle at (70, 135) with width 90 and height 34.
; PLAN: r0=70(x), r1=135(y), r2=90(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 135
LDI r2, 90
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
