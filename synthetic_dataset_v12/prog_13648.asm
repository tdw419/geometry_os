; DESCRIPTION: Renders a black box of size 31x25 starting at (24, 163).
; PLAN: r0=24(x), r1=163(y), r2=31(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 163
LDI r2, 31
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
