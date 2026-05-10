; DESCRIPTION: Renders a yellow box of size 88x42 starting at (96, 62).
; PLAN: r0=96(x), r1=62(y), r2=88(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 62
LDI r2, 88
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
