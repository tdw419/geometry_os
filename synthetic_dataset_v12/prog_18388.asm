; DESCRIPTION: Creates a orange rectangular region at (212, 92) spanning 57 by 92 pixels.
; PLAN: r0=212(x), r1=92(y), r2=57(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 92
LDI r2, 57
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
