; DESCRIPTION: Draws a orange rectangle at (245, 24) with width 24 and height 76.
; PLAN: r0=245(x), r1=24(y), r2=24(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 24
LDI r2, 24
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
