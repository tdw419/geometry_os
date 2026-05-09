; DESCRIPTION: Creates a blue rectangular region at (88, 107) spanning 19 by 19 pixels.
; PLAN: r0=88(x), r1=107(y), r2=19(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 107
LDI r2, 19
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
