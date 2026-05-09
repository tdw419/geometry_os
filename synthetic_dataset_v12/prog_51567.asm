; DESCRIPTION: Creates a orange rectangular region at (66, 75) spanning 116 by 109 pixels.
; PLAN: r0=66(x), r1=75(y), r2=116(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 75
LDI r2, 116
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
