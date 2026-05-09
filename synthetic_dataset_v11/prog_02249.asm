; DESCRIPTION: Creates a blue rectangular region at (58, 170) spanning 28 by 50 pixels.
; PLAN: r0=58(x), r1=170(y), r2=28(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 170
LDI r2, 28
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
