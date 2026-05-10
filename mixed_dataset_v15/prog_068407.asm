; DESCRIPTION: Creates a blue rectangular region at (275, 14) spanning 62 by 25 pixels.
; PLAN: r0=275(x), r1=14(y), r2=62(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 14
LDI r2, 62
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
