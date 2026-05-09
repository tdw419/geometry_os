; DESCRIPTION: Creates a purple rectangular region at (76, 107) spanning 20 by 37 pixels.
; PLAN: r0=76(x), r1=107(y), r2=20(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 107
LDI r2, 20
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
