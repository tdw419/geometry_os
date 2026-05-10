; DESCRIPTION: Draws a white rectangle at (311, 70) with width 46 and height 48.
; PLAN: r0=311(x), r1=70(y), r2=46(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 70
LDI r2, 46
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
