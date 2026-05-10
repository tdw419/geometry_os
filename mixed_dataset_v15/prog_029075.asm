; DESCRIPTION: Renders a black box of size 19x57 starting at (99, 57).
; PLAN: r0=99(x), r1=57(y), r2=19(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 57
LDI r2, 19
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
