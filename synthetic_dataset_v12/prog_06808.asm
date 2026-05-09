; DESCRIPTION: Creates a orange rectangular region at (28, 33) spanning 92 by 77 pixels.
; PLAN: r0=28(x), r1=33(y), r2=92(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 33
LDI r2, 92
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
