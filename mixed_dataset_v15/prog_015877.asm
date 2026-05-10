; DESCRIPTION: Creates a green rectangular region at (237, 43) spanning 34 by 64 pixels.
; PLAN: r0=237(x), r1=43(y), r2=34(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 43
LDI r2, 34
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
