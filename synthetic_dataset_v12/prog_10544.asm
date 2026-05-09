; DESCRIPTION: Creates a purple rectangular region at (140, 16) spanning 72 by 49 pixels.
; PLAN: r0=140(x), r1=16(y), r2=72(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 16
LDI r2, 72
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
