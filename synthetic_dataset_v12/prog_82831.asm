; DESCRIPTION: Creates a purple rectangular region at (290, 78) spanning 101 by 28 pixels.
; PLAN: r0=290(x), r1=78(y), r2=101(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 78
LDI r2, 101
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
