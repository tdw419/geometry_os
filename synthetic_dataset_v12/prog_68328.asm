; DESCRIPTION: Creates a purple rectangular region at (279, 78) spanning 66 by 95 pixels.
; PLAN: r0=279(x), r1=78(y), r2=66(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 78
LDI r2, 66
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
