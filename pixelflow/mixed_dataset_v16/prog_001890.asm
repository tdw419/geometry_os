; DESCRIPTION: Draws a white rectangle at (178, 87) with width 72 and height 78.
; PLAN: r0=178(x), r1=87(y), r2=72(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 87
LDI r2, 72
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
