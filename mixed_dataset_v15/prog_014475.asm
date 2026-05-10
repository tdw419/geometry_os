; DESCRIPTION: Renders a red box of size 64x87 starting at (214, 155).
; PLAN: r0=214(x), r1=155(y), r2=64(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 155
LDI r2, 64
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
