; DESCRIPTION: Creates a purple rectangular region at (71, 69) spanning 86 by 26 pixels.
; PLAN: r0=71(x), r1=69(y), r2=86(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 69
LDI r2, 86
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
