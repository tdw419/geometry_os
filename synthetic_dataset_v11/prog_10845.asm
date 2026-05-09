; DESCRIPTION: Renders a black box of size 59x103 starting at (88, 37).
; PLAN: r0=88(x), r1=37(y), r2=59(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 37
LDI r2, 59
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
