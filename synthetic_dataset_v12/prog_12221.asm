; DESCRIPTION: Creates a orange rectangular region at (289, 90) spanning 42 by 29 pixels.
; PLAN: r0=289(x), r1=90(y), r2=42(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 90
LDI r2, 42
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
