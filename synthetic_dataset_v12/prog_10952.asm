; DESCRIPTION: Renders a black box of size 117x29 starting at (381, 59).
; PLAN: r0=381(x), r1=59(y), r2=117(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 59
LDI r2, 117
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
