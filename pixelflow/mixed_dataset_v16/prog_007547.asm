; DESCRIPTION: Renders a orange rectangular region spanning 30 by 97 at (265, 121).
; PLAN: r0=265(x), r1=121(y), r2=30(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 121
LDI r2, 30
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
