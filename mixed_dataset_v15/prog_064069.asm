; DESCRIPTION: Renders a orange rectangular region spanning 97 by 55 at (69, 157).
; PLAN: r0=69(x), r1=157(y), r2=97(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 157
LDI r2, 97
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
