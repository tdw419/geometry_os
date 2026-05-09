; DESCRIPTION: Draws a white rectangle at (366, 152) with width 69 and height 86.
; PLAN: r0=366(x), r1=152(y), r2=69(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 152
LDI r2, 69
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
