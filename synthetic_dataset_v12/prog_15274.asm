; DESCRIPTION: Creates a purple rectangular region at (458, 135) spanning 30 by 65 pixels.
; PLAN: r0=458(x), r1=135(y), r2=30(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 135
LDI r2, 30
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
