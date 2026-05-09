; DESCRIPTION: Renders a green box of size 48x88 starting at (199, 105).
; PLAN: r0=199(x), r1=105(y), r2=48(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 105
LDI r2, 48
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
