; DESCRIPTION: Renders a black box of size 66x112 starting at (400, 129).
; PLAN: r0=400(x), r1=129(y), r2=66(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 129
LDI r2, 66
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
