; DESCRIPTION: Creates a purple rectangular region at (372, 170) spanning 117 by 36 pixels.
; PLAN: r0=372(x), r1=170(y), r2=117(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 170
LDI r2, 117
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
