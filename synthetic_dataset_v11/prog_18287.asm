; DESCRIPTION: Creates a orange rectangular region at (109, 61) spanning 15 by 27 pixels.
; PLAN: r0=109(x), r1=61(y), r2=15(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 61
LDI r2, 15
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
