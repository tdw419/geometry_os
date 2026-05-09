; DESCRIPTION: Renders a black box of size 46x37 starting at (221, 153).
; PLAN: r0=221(x), r1=153(y), r2=46(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 153
LDI r2, 46
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
