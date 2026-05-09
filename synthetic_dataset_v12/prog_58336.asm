; DESCRIPTION: Renders a yellow box of size 43x75 starting at (10, 18).
; PLAN: r0=10(x), r1=18(y), r2=43(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 18
LDI r2, 43
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
