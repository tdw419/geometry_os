; DESCRIPTION: Draws a white rectangle at (235, 28) with width 22 and height 85.
; PLAN: r0=235(x), r1=28(y), r2=22(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 28
LDI r2, 22
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
