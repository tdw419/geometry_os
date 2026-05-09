; DESCRIPTION: Creates a orange rectangular region at (116, 40) spanning 27 by 73 pixels.
; PLAN: r0=116(x), r1=40(y), r2=27(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 40
LDI r2, 27
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
