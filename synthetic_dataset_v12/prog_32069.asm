; DESCRIPTION: Renders a yellow box of size 28x10 starting at (299, 99).
; PLAN: r0=299(x), r1=99(y), r2=28(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 99
LDI r2, 28
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
