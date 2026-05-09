; DESCRIPTION: Renders a black box of size 29x69 starting at (342, 124).
; PLAN: r0=342(x), r1=124(y), r2=29(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 124
LDI r2, 29
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
