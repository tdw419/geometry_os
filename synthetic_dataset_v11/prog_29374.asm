; DESCRIPTION: Creates a purple rectangular region at (23, 182) spanning 83 by 11 pixels.
; PLAN: r0=23(x), r1=182(y), r2=83(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 182
LDI r2, 83
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
