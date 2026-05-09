; DESCRIPTION: Creates a purple rectangular region at (138, 171) spanning 13 by 62 pixels.
; PLAN: r0=138(x), r1=171(y), r2=13(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 171
LDI r2, 13
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
