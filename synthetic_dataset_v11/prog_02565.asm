; DESCRIPTION: Renders a yellow box of size 116x105 starting at (109, 5).
; PLAN: r0=109(x), r1=5(y), r2=116(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 5
LDI r2, 116
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
