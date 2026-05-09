; DESCRIPTION: Creates a orange rectangular region at (116, 194) spanning 109 by 30 pixels.
; PLAN: r0=116(x), r1=194(y), r2=109(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 194
LDI r2, 109
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
