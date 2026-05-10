; DESCRIPTION: Renders a orange rectangular region spanning 56 by 68 at (35, 68).
; PLAN: r0=35(x), r1=68(y), r2=56(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 68
LDI r2, 56
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
