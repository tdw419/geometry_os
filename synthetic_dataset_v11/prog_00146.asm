; DESCRIPTION: Renders a black box of size 88x15 starting at (128, 92).
; PLAN: r0=128(x), r1=92(y), r2=88(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 92
LDI r2, 88
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
