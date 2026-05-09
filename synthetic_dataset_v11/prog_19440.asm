; DESCRIPTION: Renders a yellow box of size 59x46 starting at (28, 128).
; PLAN: r0=28(x), r1=128(y), r2=59(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 128
LDI r2, 59
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
