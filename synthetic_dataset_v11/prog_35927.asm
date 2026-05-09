; DESCRIPTION: Creates a orange rectangular region at (7, 92) spanning 79 by 24 pixels.
; PLAN: r0=7(x), r1=92(y), r2=79(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 92
LDI r2, 79
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
