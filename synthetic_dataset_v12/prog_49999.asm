; DESCRIPTION: Draws a white rectangle at (154, 140) with width 22 and height 63.
; PLAN: r0=154(x), r1=140(y), r2=22(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 140
LDI r2, 22
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
