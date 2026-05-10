; DESCRIPTION: Creates a orange rectangular region at (116, 128) spanning 65 by 101 pixels.
; PLAN: r0=116(x), r1=128(y), r2=65(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 128
LDI r2, 65
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
