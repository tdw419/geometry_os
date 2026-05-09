; DESCRIPTION: Draws a orange rectangle at (157, 152) with width 13 and height 92.
; PLAN: r0=157(x), r1=152(y), r2=13(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 152
LDI r2, 13
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
