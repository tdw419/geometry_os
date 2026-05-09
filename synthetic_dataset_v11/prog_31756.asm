; DESCRIPTION: Renders a black box of size 52x63 starting at (61, 118).
; PLAN: r0=61(x), r1=118(y), r2=52(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 118
LDI r2, 52
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
