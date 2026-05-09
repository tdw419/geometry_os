; DESCRIPTION: Creates a purple rectangular region at (27, 123) spanning 46 by 61 pixels.
; PLAN: r0=27(x), r1=123(y), r2=46(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 123
LDI r2, 46
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
