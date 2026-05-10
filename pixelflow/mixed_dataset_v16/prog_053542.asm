; DESCRIPTION: Draws a black rectangle at (154, 148) with width 30 and height 87.
; PLAN: r0=154(x), r1=148(y), r2=30(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 148
LDI r2, 30
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
