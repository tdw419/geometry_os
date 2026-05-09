; DESCRIPTION: Draws a white rectangle at (154, 52) with width 101 and height 58.
; PLAN: r0=154(x), r1=52(y), r2=101(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 52
LDI r2, 101
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
