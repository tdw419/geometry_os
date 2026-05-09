; DESCRIPTION: Creates a orange rectangular region at (116, 3) spanning 23 by 12 pixels.
; PLAN: r0=116(x), r1=3(y), r2=23(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 3
LDI r2, 23
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
