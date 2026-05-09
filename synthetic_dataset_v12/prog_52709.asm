; DESCRIPTION: Renders a green box of size 11x111 starting at (278, 100).
; PLAN: r0=278(x), r1=100(y), r2=11(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 100
LDI r2, 11
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
