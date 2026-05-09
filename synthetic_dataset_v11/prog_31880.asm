; DESCRIPTION: Creates a orange rectangular region at (228, 62) spanning 24 by 72 pixels.
; PLAN: r0=228(x), r1=62(y), r2=24(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 62
LDI r2, 24
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
