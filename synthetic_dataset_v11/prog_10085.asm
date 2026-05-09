; DESCRIPTION: Creates a orange rectangular region at (11, 182) spanning 83 by 56 pixels.
; PLAN: r0=11(x), r1=182(y), r2=83(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 182
LDI r2, 83
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
