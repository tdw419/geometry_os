; DESCRIPTION: Renders a green box of size 43x55 starting at (188, 22).
; PLAN: r0=188(x), r1=22(y), r2=43(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 22
LDI r2, 43
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
