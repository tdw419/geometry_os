; DESCRIPTION: Draws a orange rectangle at (152, 30) with width 77 and height 55.
; PLAN: r0=152(x), r1=30(y), r2=77(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 30
LDI r2, 77
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
