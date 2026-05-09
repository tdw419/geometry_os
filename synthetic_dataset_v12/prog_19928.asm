; DESCRIPTION: Creates a blue rectangular region at (396, 27) spanning 40 by 99 pixels.
; PLAN: r0=396(x), r1=27(y), r2=40(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 27
LDI r2, 40
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
