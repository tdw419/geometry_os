; DESCRIPTION: Creates a orange rectangular region at (282, 1) spanning 61 by 112 pixels.
; PLAN: r0=282(x), r1=1(y), r2=61(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 1
LDI r2, 61
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
