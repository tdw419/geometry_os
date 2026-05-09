; DESCRIPTION: Renders a yellow box of size 64x72 starting at (40, 25).
; PLAN: r0=40(x), r1=25(y), r2=64(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 25
LDI r2, 64
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
