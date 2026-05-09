; DESCRIPTION: Creates a orange rectangular region at (267, 92) spanning 11 by 37 pixels.
; PLAN: r0=267(x), r1=92(y), r2=11(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 92
LDI r2, 11
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
