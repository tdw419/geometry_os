; DESCRIPTION: Draws a white rectangle at (129, 149) with width 83 and height 14.
; PLAN: r0=129(x), r1=149(y), r2=83(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 149
LDI r2, 83
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
