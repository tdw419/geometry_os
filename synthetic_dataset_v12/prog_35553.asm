; DESCRIPTION: Creates a orange rectangular region at (66, 92) spanning 15 by 87 pixels.
; PLAN: r0=66(x), r1=92(y), r2=15(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 92
LDI r2, 15
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
