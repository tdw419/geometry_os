; DESCRIPTION: Renders a black box of size 71x58 starting at (126, 32).
; PLAN: r0=126(x), r1=32(y), r2=71(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 32
LDI r2, 71
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
