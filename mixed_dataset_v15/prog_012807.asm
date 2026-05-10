; DESCRIPTION: Renders a green box of size 17x111 starting at (20, 73).
; PLAN: r0=20(x), r1=73(y), r2=17(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 73
LDI r2, 17
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
