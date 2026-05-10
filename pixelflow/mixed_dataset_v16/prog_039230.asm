; DESCRIPTION: Creates a purple rectangular region at (178, 184) spanning 99 by 53 pixels.
; PLAN: r0=178(x), r1=184(y), r2=99(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 184
LDI r2, 99
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
