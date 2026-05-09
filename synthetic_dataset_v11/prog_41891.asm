; DESCRIPTION: Renders a yellow box of size 33x96 starting at (173, 23).
; PLAN: r0=173(x), r1=23(y), r2=33(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 23
LDI r2, 33
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
