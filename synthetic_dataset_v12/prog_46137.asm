; DESCRIPTION: Creates a purple rectangular region at (7, 98) spanning 15 by 95 pixels.
; PLAN: r0=7(x), r1=98(y), r2=15(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 98
LDI r2, 15
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
