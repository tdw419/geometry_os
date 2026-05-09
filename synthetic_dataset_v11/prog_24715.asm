; DESCRIPTION: Renders a yellow box of size 91x27 starting at (163, 116).
; PLAN: r0=163(x), r1=116(y), r2=91(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 116
LDI r2, 91
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
