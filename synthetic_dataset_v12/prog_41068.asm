; DESCRIPTION: Draws a orange rectangle at (458, 39) with width 10 and height 12.
; PLAN: r0=458(x), r1=39(y), r2=10(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 39
LDI r2, 10
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
