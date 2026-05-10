; DESCRIPTION: Creates a blue rectangular region at (71, 78) spanning 27 by 36 pixels.
; PLAN: r0=71(x), r1=78(y), r2=27(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 78
LDI r2, 27
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
