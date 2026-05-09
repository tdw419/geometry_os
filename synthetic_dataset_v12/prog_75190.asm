; DESCRIPTION: Draws a orange rectangle at (294, 43) with width 26 and height 120.
; PLAN: r0=294(x), r1=43(y), r2=26(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 43
LDI r2, 26
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
