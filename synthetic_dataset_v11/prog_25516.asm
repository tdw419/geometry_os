; DESCRIPTION: Renders a black box of size 68x93 starting at (99, 68).
; PLAN: r0=99(x), r1=68(y), r2=68(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 68
LDI r2, 68
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
