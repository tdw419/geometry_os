; DESCRIPTION: Renders a black box of size 72x88 starting at (173, 13).
; PLAN: r0=173(x), r1=13(y), r2=72(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 13
LDI r2, 72
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
