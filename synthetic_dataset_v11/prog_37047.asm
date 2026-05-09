; DESCRIPTION: Renders a black box of size 105x59 starting at (39, 0).
; PLAN: r0=39(x), r1=0(y), r2=105(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 0
LDI r2, 105
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
