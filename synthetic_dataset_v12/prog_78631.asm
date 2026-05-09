; DESCRIPTION: Draws a white rectangle at (412, 72) with width 65 and height 106.
; PLAN: r0=412(x), r1=72(y), r2=65(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 72
LDI r2, 65
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
