; DESCRIPTION: Creates a purple rectangular region at (29, 37) spanning 69 by 109 pixels.
; PLAN: r0=29(x), r1=37(y), r2=69(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 37
LDI r2, 69
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
