; DESCRIPTION: Creates a purple rectangular region at (71, 148) spanning 90 by 17 pixels.
; PLAN: r0=71(x), r1=148(y), r2=90(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 148
LDI r2, 90
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
