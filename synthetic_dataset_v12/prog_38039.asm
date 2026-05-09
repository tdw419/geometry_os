; DESCRIPTION: Renders a green box of size 116x43 starting at (36, 0).
; PLAN: r0=36(x), r1=0(y), r2=116(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 0
LDI r2, 116
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
