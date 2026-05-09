; DESCRIPTION: Draws a white rectangle at (46, 40) with width 102 and height 76.
; PLAN: r0=46(x), r1=40(y), r2=102(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 40
LDI r2, 102
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
