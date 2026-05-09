; DESCRIPTION: Draws a orange rectangle at (109, 108) with width 33 and height 72.
; PLAN: r0=109(x), r1=108(y), r2=33(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 108
LDI r2, 33
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
