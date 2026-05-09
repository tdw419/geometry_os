; DESCRIPTION: Draws a white rectangle at (193, 76) with width 74 and height 102.
; PLAN: r0=193(x), r1=76(y), r2=74(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 76
LDI r2, 74
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
