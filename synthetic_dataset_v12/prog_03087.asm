; DESCRIPTION: Draws a red rectangle at (22, 142) with width 16 and height 84.
; PLAN: r0=22(x), r1=142(y), r2=16(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 142
LDI r2, 16
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
