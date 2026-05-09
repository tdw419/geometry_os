; DESCRIPTION: Draws a white rectangle at (154, 3) with width 26 and height 51.
; PLAN: r0=154(x), r1=3(y), r2=26(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 3
LDI r2, 26
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
