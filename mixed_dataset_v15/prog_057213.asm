; DESCRIPTION: Draws a white rectangle at (226, 217) with width 67 and height 38.
; PLAN: r0=226(x), r1=217(y), r2=67(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 217
LDI r2, 67
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
