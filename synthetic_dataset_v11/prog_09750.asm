; DESCRIPTION: Draws a white rectangle at (152, 102) with width 83 and height 12.
; PLAN: r0=152(x), r1=102(y), r2=83(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 102
LDI r2, 83
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
