; DESCRIPTION: Creates a blue rectangular region at (239, 34) spanning 36 by 96 pixels.
; PLAN: r0=239(x), r1=34(y), r2=36(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 34
LDI r2, 36
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
