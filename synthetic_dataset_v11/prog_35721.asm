; DESCRIPTION: Creates a purple rectangular region at (203, 82) spanning 14 by 47 pixels.
; PLAN: r0=203(x), r1=82(y), r2=14(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 82
LDI r2, 14
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
