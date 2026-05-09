; DESCRIPTION: Creates a orange rectangular region at (276, 87) spanning 52 by 92 pixels.
; PLAN: r0=276(x), r1=87(y), r2=52(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 87
LDI r2, 52
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
