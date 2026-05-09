; DESCRIPTION: Creates a orange rectangular region at (2, 46) spanning 11 by 77 pixels.
; PLAN: r0=2(x), r1=46(y), r2=11(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 46
LDI r2, 11
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
