; DESCRIPTION: Creates a orange rectangular region at (5, 48) spanning 116 by 116 pixels.
; PLAN: r0=5(x), r1=48(y), r2=116(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 48
LDI r2, 116
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
