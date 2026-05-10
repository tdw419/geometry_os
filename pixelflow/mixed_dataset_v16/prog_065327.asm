; DESCRIPTION: Renders a yellow box of size 64x69 starting at (28, 28).
; PLAN: r0=28(x), r1=28(y), r2=64(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 28
LDI r2, 64
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
