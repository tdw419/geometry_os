; DESCRIPTION: Renders a green box of size 20x11 starting at (204, 74).
; PLAN: r0=204(x), r1=74(y), r2=20(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 74
LDI r2, 20
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
