; DESCRIPTION: Draws a white rectangle at (271, 62) with width 46 and height 102.
; PLAN: r0=271(x), r1=62(y), r2=46(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 62
LDI r2, 46
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
