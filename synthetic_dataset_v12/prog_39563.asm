; DESCRIPTION: Creates a orange rectangular region at (76, 42) spanning 102 by 15 pixels.
; PLAN: r0=76(x), r1=42(y), r2=102(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 42
LDI r2, 102
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
