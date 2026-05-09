; DESCRIPTION: Creates a orange rectangular region at (351, 114) spanning 26 by 42 pixels.
; PLAN: r0=351(x), r1=114(y), r2=26(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 114
LDI r2, 26
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
