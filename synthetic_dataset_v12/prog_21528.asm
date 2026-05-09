; DESCRIPTION: Creates a orange rectangular region at (73, 75) spanning 114 by 64 pixels.
; PLAN: r0=73(x), r1=75(y), r2=114(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 75
LDI r2, 114
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
