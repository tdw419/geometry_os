; DESCRIPTION: Renders a black box of size 32x18 starting at (43, 27).
; PLAN: r0=43(x), r1=27(y), r2=32(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 27
LDI r2, 32
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
