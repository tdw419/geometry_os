; DESCRIPTION: Creates a orange rectangular region at (399, 3) spanning 21 by 96 pixels.
; PLAN: r0=399(x), r1=3(y), r2=21(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 3
LDI r2, 21
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
