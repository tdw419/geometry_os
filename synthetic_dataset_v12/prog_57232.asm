; DESCRIPTION: Creates a yellow rectangular region at (324, 118) spanning 78 by 67 pixels.
; PLAN: r0=324(x), r1=118(y), r2=78(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 118
LDI r2, 78
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
