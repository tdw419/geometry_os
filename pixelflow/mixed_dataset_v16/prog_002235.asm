; DESCRIPTION: Renders a black box of size 36x93 starting at (19, 128).
; PLAN: r0=19(x), r1=128(y), r2=36(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 128
LDI r2, 36
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
