; DESCRIPTION: Renders a black box of size 35x23 starting at (160, 129).
; PLAN: r0=160(x), r1=129(y), r2=35(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 129
LDI r2, 35
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
