; DESCRIPTION: Creates a purple rectangular region at (89, 224) spanning 107 by 16 pixels.
; PLAN: r0=89(x), r1=224(y), r2=107(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 224
LDI r2, 107
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
