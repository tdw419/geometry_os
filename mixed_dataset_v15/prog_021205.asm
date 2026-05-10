; DESCRIPTION: Draws a orange rectangle at (102, 152) with width 21 and height 36.
; PLAN: r0=102(x), r1=152(y), r2=21(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 152
LDI r2, 21
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
