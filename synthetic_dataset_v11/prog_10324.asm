; DESCRIPTION: Creates a orange rectangular region at (11, 40) spanning 22 by 92 pixels.
; PLAN: r0=11(x), r1=40(y), r2=22(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 40
LDI r2, 22
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
