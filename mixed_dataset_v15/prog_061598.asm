; DESCRIPTION: Draws a orange rectangle at (152, 22) with width 61 and height 65.
; PLAN: r0=152(x), r1=22(y), r2=61(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 22
LDI r2, 61
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
