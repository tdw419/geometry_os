; DESCRIPTION: Creates a purple rectangular region at (178, 83) spanning 31 by 50 pixels.
; PLAN: r0=178(x), r1=83(y), r2=31(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 83
LDI r2, 31
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
