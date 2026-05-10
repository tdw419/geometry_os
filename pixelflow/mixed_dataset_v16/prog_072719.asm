; DESCRIPTION: Creates a blue rectangular region at (378, 114) spanning 57 by 30 pixels.
; PLAN: r0=378(x), r1=114(y), r2=57(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 114
LDI r2, 57
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
