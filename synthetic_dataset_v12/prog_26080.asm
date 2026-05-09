; DESCRIPTION: Creates a green rectangular region at (326, 54) spanning 39 by 88 pixels.
; PLAN: r0=326(x), r1=54(y), r2=39(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 54
LDI r2, 39
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
