; DESCRIPTION: Draws a orange rectangle at (212, 46) with width 30 and height 111.
; PLAN: r0=212(x), r1=46(y), r2=30(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 46
LDI r2, 30
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
