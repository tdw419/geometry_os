; DESCRIPTION: Draws a white rectangle at (69, 7) with width 54 and height 85.
; PLAN: r0=69(x), r1=7(y), r2=54(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 7
LDI r2, 54
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
