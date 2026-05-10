; DESCRIPTION: Renders a green box of size 13x35 starting at (204, 88).
; PLAN: r0=204(x), r1=88(y), r2=13(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 88
LDI r2, 13
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
