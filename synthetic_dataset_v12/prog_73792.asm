; DESCRIPTION: Renders a yellow box of size 116x56 starting at (109, 109).
; PLAN: r0=109(x), r1=109(y), r2=116(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 109
LDI r2, 116
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
