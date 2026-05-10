; DESCRIPTION: Draws a white rectangle at (214, 175) with width 45 and height 29.
; PLAN: r0=214(x), r1=175(y), r2=45(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 175
LDI r2, 45
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
