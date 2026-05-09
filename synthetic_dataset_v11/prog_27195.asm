; DESCRIPTION: Draws a orange rectangle at (152, 32) with width 69 and height 32.
; PLAN: r0=152(x), r1=32(y), r2=69(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 32
LDI r2, 69
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
