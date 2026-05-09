; DESCRIPTION: Renders a yellow box of size 77x40 starting at (35, 48).
; PLAN: r0=35(x), r1=48(y), r2=77(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 48
LDI r2, 77
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
