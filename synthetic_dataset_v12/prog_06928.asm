; DESCRIPTION: Draws a white rectangle at (153, 12) with width 109 and height 105.
; PLAN: r0=153(x), r1=12(y), r2=109(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 12
LDI r2, 109
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
