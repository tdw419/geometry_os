; DESCRIPTION: Creates a orange rectangular region at (83, 112) spanning 34 by 28 pixels.
; PLAN: r0=83(x), r1=112(y), r2=34(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 112
LDI r2, 34
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
