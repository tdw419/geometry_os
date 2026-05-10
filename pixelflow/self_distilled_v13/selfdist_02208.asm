; DESCRIPTION: Draws a white rectangle at (108, 55) with width 77 and height 86.
; PLAN: r0=108(x), r1=55(y), r2=77(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 55
LDI r2, 77
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
