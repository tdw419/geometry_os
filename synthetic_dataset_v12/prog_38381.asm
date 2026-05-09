; DESCRIPTION: Draws a white rectangle at (124, 214) with width 41 and height 29.
; PLAN: r0=124(x), r1=214(y), r2=41(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 214
LDI r2, 41
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
