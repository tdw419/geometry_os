; DESCRIPTION: Creates a orange rectangular region at (40, 145) spanning 92 by 76 pixels.
; PLAN: r0=40(x), r1=145(y), r2=92(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 145
LDI r2, 92
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
