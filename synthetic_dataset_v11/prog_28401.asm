; DESCRIPTION: Renders a black box of size 29x39 starting at (134, 160).
; PLAN: r0=134(x), r1=160(y), r2=29(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 160
LDI r2, 29
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
