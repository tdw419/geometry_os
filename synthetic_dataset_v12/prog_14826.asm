; DESCRIPTION: Draws a white rectangle at (277, 122) with width 83 and height 46.
; PLAN: r0=277(x), r1=122(y), r2=83(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 122
LDI r2, 83
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
