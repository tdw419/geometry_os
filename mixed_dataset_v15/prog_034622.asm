; DESCRIPTION: Creates a blue rectangular region at (430, 172) spanning 50 by 62 pixels.
; PLAN: r0=430(x), r1=172(y), r2=50(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 172
LDI r2, 50
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
