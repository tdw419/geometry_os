; DESCRIPTION: Creates a orange rectangular region at (407, 96) spanning 60 by 27 pixels.
; PLAN: r0=407(x), r1=96(y), r2=60(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 96
LDI r2, 60
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
