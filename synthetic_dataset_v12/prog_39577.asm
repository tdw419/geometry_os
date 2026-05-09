; DESCRIPTION: Creates a orange rectangular region at (388, 184) spanning 92 by 25 pixels.
; PLAN: r0=388(x), r1=184(y), r2=92(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 184
LDI r2, 92
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
