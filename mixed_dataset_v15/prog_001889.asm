; DESCRIPTION: Creates a orange rectangular region at (83, 96) spanning 72 by 109 pixels.
; PLAN: r0=83(x), r1=96(y), r2=72(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 96
LDI r2, 72
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
