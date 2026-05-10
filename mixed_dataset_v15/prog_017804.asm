; DESCRIPTION: Creates a green rectangular region at (128, 89) spanning 82 by 88 pixels.
; PLAN: r0=128(x), r1=89(y), r2=82(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 89
LDI r2, 82
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
