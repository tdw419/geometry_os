; DESCRIPTION: Creates a blue rectangular region at (375, 100) spanning 27 by 78 pixels.
; PLAN: r0=375(x), r1=100(y), r2=27(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 100
LDI r2, 27
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
