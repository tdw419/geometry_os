; DESCRIPTION: Creates a blue rectangular region at (28, 96) spanning 83 by 49 pixels.
; PLAN: r0=28(x), r1=96(y), r2=83(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 96
LDI r2, 83
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
