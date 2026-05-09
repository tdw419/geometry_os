; DESCRIPTION: Renders a black box of size 113x69 starting at (65, 104).
; PLAN: r0=65(x), r1=104(y), r2=113(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 104
LDI r2, 113
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
