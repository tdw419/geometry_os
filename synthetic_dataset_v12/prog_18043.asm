; DESCRIPTION: Renders a black box of size 46x106 starting at (313, 60).
; PLAN: r0=313(x), r1=60(y), r2=46(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 60
LDI r2, 46
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
