; DESCRIPTION: Creates a orange rectangular region at (355, 42) spanning 45 by 42 pixels.
; PLAN: r0=355(x), r1=42(y), r2=45(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 42
LDI r2, 45
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
