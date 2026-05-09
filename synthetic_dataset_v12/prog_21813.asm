; DESCRIPTION: Creates a purple rectangular region at (12, 68) spanning 40 by 72 pixels.
; PLAN: r0=12(x), r1=68(y), r2=40(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 68
LDI r2, 40
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
