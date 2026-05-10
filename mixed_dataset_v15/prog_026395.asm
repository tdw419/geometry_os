; DESCRIPTION: Creates a orange rectangular region at (129, 53) spanning 114 by 86 pixels.
; PLAN: r0=129(x), r1=53(y), r2=114(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 53
LDI r2, 114
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
