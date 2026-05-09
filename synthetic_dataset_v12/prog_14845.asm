; DESCRIPTION: Creates a purple rectangular region at (435, 192) spanning 12 by 26 pixels.
; PLAN: r0=435(x), r1=192(y), r2=12(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 192
LDI r2, 12
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
