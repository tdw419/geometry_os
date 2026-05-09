; DESCRIPTION: Draws a white rectangle at (101, 92) with width 111 and height 70.
; PLAN: r0=101(x), r1=92(y), r2=111(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 92
LDI r2, 111
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
