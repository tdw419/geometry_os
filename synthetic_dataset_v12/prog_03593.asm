; DESCRIPTION: Creates a orange rectangular region at (380, 36) spanning 49 by 110 pixels.
; PLAN: r0=380(x), r1=36(y), r2=49(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 36
LDI r2, 49
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
