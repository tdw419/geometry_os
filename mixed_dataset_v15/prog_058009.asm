; DESCRIPTION: Renders a black box of size 105x39 starting at (163, 117).
; PLAN: r0=163(x), r1=117(y), r2=105(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 117
LDI r2, 105
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
