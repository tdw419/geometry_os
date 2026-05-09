; DESCRIPTION: Renders a yellow box of size 28x14 starting at (2, 184).
; PLAN: r0=2(x), r1=184(y), r2=28(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 184
LDI r2, 28
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
