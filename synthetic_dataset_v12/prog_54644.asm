; DESCRIPTION: Draws a white rectangle at (435, 19) with width 46 and height 95.
; PLAN: r0=435(x), r1=19(y), r2=46(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 19
LDI r2, 46
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
