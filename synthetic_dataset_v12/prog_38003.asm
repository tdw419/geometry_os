; DESCRIPTION: Renders a black box of size 85x72 starting at (388, 106).
; PLAN: r0=388(x), r1=106(y), r2=85(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 106
LDI r2, 85
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
