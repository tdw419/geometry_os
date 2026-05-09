; DESCRIPTION: Renders a black box of size 88x100 starting at (229, 142).
; PLAN: r0=229(x), r1=142(y), r2=88(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 142
LDI r2, 88
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
