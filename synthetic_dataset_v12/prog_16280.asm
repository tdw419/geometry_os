; DESCRIPTION: Renders a black box of size 59x37 starting at (123, 66).
; PLAN: r0=123(x), r1=66(y), r2=59(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 66
LDI r2, 59
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
