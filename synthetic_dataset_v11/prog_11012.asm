; DESCRIPTION: Renders a black box of size 44x120 starting at (153, 69).
; PLAN: r0=153(x), r1=69(y), r2=44(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 69
LDI r2, 44
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
