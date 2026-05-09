; DESCRIPTION: Creates a blue rectangular region at (329, 230) spanning 78 by 26 pixels.
; PLAN: r0=329(x), r1=230(y), r2=78(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 230
LDI r2, 78
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
