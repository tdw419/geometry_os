; DESCRIPTION: Creates a orange rectangular region at (252, 61) spanning 98 by 87 pixels.
; PLAN: r0=252(x), r1=61(y), r2=98(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 61
LDI r2, 98
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
