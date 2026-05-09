; DESCRIPTION: Renders a black box of size 45x109 starting at (253, 71).
; PLAN: r0=253(x), r1=71(y), r2=45(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 71
LDI r2, 45
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
