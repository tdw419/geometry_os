; DESCRIPTION: Renders a black box of size 32x93 starting at (124, 108).
; PLAN: r0=124(x), r1=108(y), r2=32(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 108
LDI r2, 32
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
