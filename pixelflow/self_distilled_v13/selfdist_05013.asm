; DESCRIPTION: Renders a orange rectangular region spanning 58 by 116 at (232, 172).
; PLAN: r0=232(x), r1=172(y), r2=58(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 172
LDI r2, 58
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
