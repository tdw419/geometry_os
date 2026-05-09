; DESCRIPTION: Renders a black box of size 34x52 starting at (320, 1).
; PLAN: r0=320(x), r1=1(y), r2=34(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 1
LDI r2, 34
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
