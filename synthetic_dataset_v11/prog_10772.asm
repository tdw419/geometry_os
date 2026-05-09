; DESCRIPTION: Renders a red box of size 32x26 starting at (222, 185).
; PLAN: r0=222(x), r1=185(y), r2=32(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 185
LDI r2, 32
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
