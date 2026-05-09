; DESCRIPTION: Renders a yellow box of size 37x56 starting at (457, 2).
; PLAN: r0=457(x), r1=2(y), r2=37(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 2
LDI r2, 37
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
