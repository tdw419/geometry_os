; DESCRIPTION: Renders a red box of size 99x37 starting at (128, 45).
; PLAN: r0=128(x), r1=45(y), r2=99(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 45
LDI r2, 99
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
