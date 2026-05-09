; DESCRIPTION: Creates a purple rectangular region at (308, 78) spanning 112 by 107 pixels.
; PLAN: r0=308(x), r1=78(y), r2=112(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 78
LDI r2, 112
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
