; DESCRIPTION: Renders a black box of size 69x19 starting at (7, 201).
; PLAN: r0=7(x), r1=201(y), r2=69(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 201
LDI r2, 69
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
