; DESCRIPTION: Creates a orange rectangular region at (316, 151) spanning 18 by 101 pixels.
; PLAN: r0=316(x), r1=151(y), r2=18(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 151
LDI r2, 18
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
