; DESCRIPTION: Renders a yellow box of size 13x56 starting at (223, 135).
; PLAN: r0=223(x), r1=135(y), r2=13(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 135
LDI r2, 13
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
