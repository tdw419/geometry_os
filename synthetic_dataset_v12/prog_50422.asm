; DESCRIPTION: Creates a purple rectangular region at (265, 148) spanning 68 by 69 pixels.
; PLAN: r0=265(x), r1=148(y), r2=68(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 148
LDI r2, 68
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
