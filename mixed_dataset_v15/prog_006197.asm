; DESCRIPTION: Renders a yellow box of size 28x82 starting at (3, 97).
; PLAN: r0=3(x), r1=97(y), r2=28(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 97
LDI r2, 28
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
