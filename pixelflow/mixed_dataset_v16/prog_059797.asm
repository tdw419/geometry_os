; DESCRIPTION: Renders a black box of size 36x22 starting at (274, 222).
; PLAN: r0=274(x), r1=222(y), r2=36(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 222
LDI r2, 36
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
