; DESCRIPTION: Renders a yellow box of size 49x12 starting at (173, 181).
; PLAN: r0=173(x), r1=181(y), r2=49(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 181
LDI r2, 49
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
