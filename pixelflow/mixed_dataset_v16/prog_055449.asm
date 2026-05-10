; DESCRIPTION: Draws a white rectangle at (185, 1) with width 90 and height 72.
; PLAN: r0=185(x), r1=1(y), r2=90(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 1
LDI r2, 90
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
