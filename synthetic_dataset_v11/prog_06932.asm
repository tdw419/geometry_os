; DESCRIPTION: Creates a blue rectangular region at (122, 107) spanning 59 by 118 pixels.
; PLAN: r0=122(x), r1=107(y), r2=59(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 107
LDI r2, 59
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
