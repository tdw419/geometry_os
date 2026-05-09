; DESCRIPTION: Creates a blue rectangular region at (78, 39) spanning 27 by 63 pixels.
; PLAN: r0=78(x), r1=39(y), r2=27(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 39
LDI r2, 27
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
