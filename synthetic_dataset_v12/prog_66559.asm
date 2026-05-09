; DESCRIPTION: Creates a purple rectangular region at (364, 103) spanning 18 by 29 pixels.
; PLAN: r0=364(x), r1=103(y), r2=18(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 103
LDI r2, 18
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
