; DESCRIPTION: Renders a black box of size 29x105 starting at (198, 76).
; PLAN: r0=198(x), r1=76(y), r2=29(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 76
LDI r2, 29
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
