; DESCRIPTION: Renders a black box of size 64x36 starting at (172, 148).
; PLAN: r0=172(x), r1=148(y), r2=64(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 148
LDI r2, 64
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
