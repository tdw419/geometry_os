; DESCRIPTION: Renders a red box of size 65x19 starting at (32, 176).
; PLAN: r0=32(x), r1=176(y), r2=65(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 176
LDI r2, 65
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
