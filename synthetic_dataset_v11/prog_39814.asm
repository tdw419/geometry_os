; DESCRIPTION: Renders a black box of size 31x32 starting at (12, 15).
; PLAN: r0=12(x), r1=15(y), r2=31(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 15
LDI r2, 31
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
