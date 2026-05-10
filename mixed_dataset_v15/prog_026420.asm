; DESCRIPTION: Creates a green rectangular region at (214, 61) spanning 32 by 88 pixels.
; PLAN: r0=214(x), r1=61(y), r2=32(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 61
LDI r2, 32
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
