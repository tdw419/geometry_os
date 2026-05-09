; DESCRIPTION: Creates a purple rectangular region at (405, 35) spanning 15 by 14 pixels.
; PLAN: r0=405(x), r1=35(y), r2=15(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 35
LDI r2, 15
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
