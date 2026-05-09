; DESCRIPTION: Creates a blue rectangular region at (245, 83) spanning 87 by 20 pixels.
; PLAN: r0=245(x), r1=83(y), r2=87(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 87
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
