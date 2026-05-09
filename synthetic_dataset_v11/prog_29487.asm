; DESCRIPTION: Creates a purple rectangular region at (152, 170) spanning 28 by 80 pixels.
; PLAN: r0=152(x), r1=170(y), r2=28(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 170
LDI r2, 28
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
