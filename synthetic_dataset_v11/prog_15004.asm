; DESCRIPTION: Creates a purple rectangular region at (102, 68) spanning 99 by 39 pixels.
; PLAN: r0=102(x), r1=68(y), r2=99(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 68
LDI r2, 99
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
