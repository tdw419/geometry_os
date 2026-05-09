; DESCRIPTION: Creates a orange rectangular region at (266, 27) spanning 48 by 96 pixels.
; PLAN: r0=266(x), r1=27(y), r2=48(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 27
LDI r2, 48
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
