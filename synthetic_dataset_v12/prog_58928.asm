; DESCRIPTION: Creates a purple rectangular region at (405, 23) spanning 85 by 44 pixels.
; PLAN: r0=405(x), r1=23(y), r2=85(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 23
LDI r2, 85
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
