; DESCRIPTION: Draws a white rectangle at (294, 25) with width 101 and height 22.
; PLAN: r0=294(x), r1=25(y), r2=101(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 25
LDI r2, 101
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
