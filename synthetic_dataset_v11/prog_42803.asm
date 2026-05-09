; DESCRIPTION: Creates a orange rectangular region at (147, 92) spanning 39 by 79 pixels.
; PLAN: r0=147(x), r1=92(y), r2=39(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 92
LDI r2, 39
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
