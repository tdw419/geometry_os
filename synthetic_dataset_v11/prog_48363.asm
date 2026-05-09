; DESCRIPTION: Draws a white rectangle at (123, 121) with width 102 and height 91.
; PLAN: r0=123(x), r1=121(y), r2=102(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 121
LDI r2, 102
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
