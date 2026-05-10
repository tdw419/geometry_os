; DESCRIPTION: Renders a yellow box of size 87x19 starting at (86, 116).
; PLAN: r0=86(x), r1=116(y), r2=87(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 116
LDI r2, 87
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
