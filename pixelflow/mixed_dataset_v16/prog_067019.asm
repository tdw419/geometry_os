; DESCRIPTION: Renders a yellow box of size 42x101 starting at (288, 3).
; PLAN: r0=288(x), r1=3(y), r2=42(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 3
LDI r2, 42
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
