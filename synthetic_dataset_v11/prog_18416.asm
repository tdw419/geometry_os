; DESCRIPTION: Renders a green box of size 17x88 starting at (150, 10).
; PLAN: r0=150(x), r1=10(y), r2=17(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 10
LDI r2, 17
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
