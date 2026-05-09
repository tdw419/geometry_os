; DESCRIPTION: Creates a purple rectangular region at (119, 3) spanning 82 by 33 pixels.
; PLAN: r0=119(x), r1=3(y), r2=82(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 3
LDI r2, 82
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
