; DESCRIPTION: Renders a yellow box of size 77x46 starting at (85, 48).
; PLAN: r0=85(x), r1=48(y), r2=77(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 48
LDI r2, 77
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
