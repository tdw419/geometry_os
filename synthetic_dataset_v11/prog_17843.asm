; DESCRIPTION: Creates a blue rectangular region at (192, 194) spanning 49 by 27 pixels.
; PLAN: r0=192(x), r1=194(y), r2=49(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 194
LDI r2, 49
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
