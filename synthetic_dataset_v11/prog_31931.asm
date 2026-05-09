; DESCRIPTION: Creates a purple rectangular region at (28, 83) spanning 46 by 86 pixels.
; PLAN: r0=28(x), r1=83(y), r2=46(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 83
LDI r2, 46
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
