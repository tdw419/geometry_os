; DESCRIPTION: Renders a yellow box of size 88x21 starting at (128, 159).
; PLAN: r0=128(x), r1=159(y), r2=88(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 159
LDI r2, 88
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
