; DESCRIPTION: Renders a yellow box of size 11x91 starting at (421, 6).
; PLAN: r0=421(x), r1=6(y), r2=11(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 6
LDI r2, 11
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
