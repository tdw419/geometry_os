; DESCRIPTION: Draws a white rectangle at (76, 58) with width 118 and height 108.
; PLAN: r0=76(x), r1=58(y), r2=118(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 58
LDI r2, 118
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
