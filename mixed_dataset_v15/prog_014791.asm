; DESCRIPTION: Creates a purple rectangular region at (294, 105) spanning 62 by 12 pixels.
; PLAN: r0=294(x), r1=105(y), r2=62(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 105
LDI r2, 62
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
