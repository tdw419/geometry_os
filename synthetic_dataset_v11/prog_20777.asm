; DESCRIPTION: Creates a purple rectangular region at (203, 71) spanning 28 by 89 pixels.
; PLAN: r0=203(x), r1=71(y), r2=28(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 71
LDI r2, 28
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
