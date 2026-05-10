; DESCRIPTION: Renders a green box of size 102x88 starting at (39, 4).
; PLAN: r0=39(x), r1=4(y), r2=102(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 4
LDI r2, 102
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
