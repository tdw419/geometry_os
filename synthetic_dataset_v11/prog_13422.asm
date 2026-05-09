; DESCRIPTION: Creates a blue rectangular region at (17, 14) spanning 28 by 27 pixels.
; PLAN: r0=17(x), r1=14(y), r2=28(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 14
LDI r2, 28
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
