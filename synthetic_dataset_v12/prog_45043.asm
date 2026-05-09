; DESCRIPTION: Creates a orange rectangular region at (211, 81) spanning 96 by 100 pixels.
; PLAN: r0=211(x), r1=81(y), r2=96(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 81
LDI r2, 96
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
