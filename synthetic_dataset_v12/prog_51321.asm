; DESCRIPTION: Creates a orange rectangular region at (64, 172) spanning 116 by 67 pixels.
; PLAN: r0=64(x), r1=172(y), r2=116(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 172
LDI r2, 116
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
