; DESCRIPTION: Draws a orange rectangle at (274, 4) with width 109 and height 76.
; PLAN: r0=274(x), r1=4(y), r2=109(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 4
LDI r2, 109
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
