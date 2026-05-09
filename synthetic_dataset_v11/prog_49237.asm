; DESCRIPTION: Renders a yellow box of size 43x72 starting at (179, 8).
; PLAN: r0=179(x), r1=8(y), r2=43(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 8
LDI r2, 43
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
