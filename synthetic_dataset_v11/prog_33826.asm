; DESCRIPTION: Renders a red box of size 43x32 starting at (133, 224).
; PLAN: r0=133(x), r1=224(y), r2=43(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 224
LDI r2, 43
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
