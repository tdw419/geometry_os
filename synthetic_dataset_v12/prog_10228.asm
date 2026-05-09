; DESCRIPTION: Renders a black box of size 109x45 starting at (71, 3).
; PLAN: r0=71(x), r1=3(y), r2=109(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 3
LDI r2, 109
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
